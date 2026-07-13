---
layout: post
title: "OpenCode with OpenRouter and local models"
featured_image: /images/opencode.png
---

[OpenCode](https://opencode.ai) is a terminal coding agent that works with any
model. Unlike tools tied to a single vendor, you point it at whatever backend
you like: a cloud router such as [OpenRouter](https://openrouter.ai), or a model
you serve yourself with Ollama or vLLM.

### Installation

Two easy ways to install it:

```bash
curl -fsSL https://opencode.ai/install | bash
```

or, on macOS with Homebrew:

```bash
brew install anomalyco/tap/opencode
```

### Using OpenRouter

OpenRouter gives you one API key and one endpoint for hundreds of models, so you
can switch without juggling separate accounts.

Create a key at [openrouter.ai/keys](https://openrouter.ai/keys) and export it:

```bash
export OPENROUTER_API_KEY="sk-or-..."
```

Then run `opencode` and pick an OpenRouter model, or set one in
`~/.config/opencode/opencode.json`:

```json
{
  "$schema": "https://opencode.ai/config.json",
  "provider": {
    "openrouter": {
      "models": {
        "anthropic/claude-sonnet-4.5": {},
        "openai/gpt-5-mini": {},
        "qwen/qwen3-coder": {}
      }
    }
  }
}
```

Some models that are solid for coding without being too expensive:

- **`anthropic/claude-sonnet-4.5`** — the safe default when you want quality and
  reliable tool calling, and don't mind paying a bit more.
- **`openai/gpt-5-mini`** — cheap, fast, good enough for most day-to-day edits.
- **`qwen/qwen3-coder`** — strong open-weight coder, very cheap per token.
- **`deepseek/deepseek-chat`** — capable and among the cheapest for larger jobs.

Start on a cheap model and only reach for a premium one when a task actually
needs it. Costs add up quickly when the agent iterates.

### Serving your own model with vLLM

If you run a model locally, you keep your code private and pay nothing per token.
[vLLM](https://docs.vllm.ai) exposes an OpenAI-compatible API, so OpenCode talks
to it the same way it talks to any cloud provider.

Serve a model on port 8000:

```bash
vllm serve Qwen/Qwen3-Coder-30B-A3B-Instruct --port 8000
```

Then add a local provider pointing at that endpoint:

```json
{
  "$schema": "https://opencode.ai/config.json",
  "provider": {
    "vllm": {
      "npm": "@ai-sdk/openai-compatible",
      "options": {
        "baseURL": "http://localhost:8000/v1"
      },
      "models": {
        "Qwen/Qwen3-Coder-30B-A3B-Instruct": {}
      }
    }
  }
}
```

The `baseURL` must include the `/v1` suffix, and the model name must match what
vLLM reports at `http://localhost:8000/v1/models`.

The same recipe works for [Ollama](https://ollama.com), which also serves an
OpenAI-compatible API — just point `baseURL` at `http://localhost:11434/v1`.

### Links

🔗 [OpenCode](https://opencode.ai)
🔗 [OpenRouter](https://openrouter.ai)
🔗 [vLLM](https://docs.vllm.ai)
