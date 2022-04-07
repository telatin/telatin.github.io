#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
OUT_DIR="$SCRIPT_DIR/../_posts"
DATE=$(date +%Y-%m-%d)

if [ -z ${1+x} ];then
    echo "Provide post title (eg. with dashes instead of spaces)";
    exit 2;
else
    TITLE=$(echo "$1" | sed 's/ /-/g' | sed 's/_/-/g');
    NICE_TITLE=$(echo "$TITLE" | sed 's/-/ /g');
    POST_FILE="$OUT_DIR/$DATE-$TITLE.md";

    #echo "Post title: $NICE_TITLE";
    echo "nano \"$POST_FILE\"";
fi

if [[ ! -d "$OUT_DIR" ]]; then
	echo "Output directory expected at: $OUT_DIR. Not found"
	exit 1
fi


if [[ -e "$POST_FILE" ]]; then
	echo "File exists!";
else

echo "---
layout: post
title: $NICE_TITLE
---" >> $POST_FILE
fi
