# Stage 1: Build Jekyll site
FROM ruby:3.0.0-alpine as builder

WORKDIR /srv/jekyll

# Install build dependencies
RUN apk add --no-cache build-base nodejs

# Copy Gemfile and Gemfile.lock (if it exists)
COPY Gemfile Gemfile.lock ./

# Install Bundler and then Jekyll dependencies
RUN gem install bundler && bundle install --jobs 4 --retry 3

# Copy the rest of the Jekyll site
COPY . .

# Build the Jekyll site
# For local development, we override the baseurl to be empty.
# For GitHub Pages, you would typically build without --baseurl "" or use a separate config.
RUN jekyll build --baseurl ""

# Stage 2: Serve with Nginx
FROM nginx:alpine

# Copy the built site from the builder stage
COPY --from=builder /srv/jekyll/_site /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
