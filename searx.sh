#!/bin/bash
# SearXNG Wrapper for OpenClaw

QUERY="${1:-}"
CATEGORY="${2:-general}"

# Default endpoint
SEARX_URL="http://127.0.0.1:8080/search"

if [ -z "$QUERY" ]; then
  echo "Usage: searx <query> [category]"
  exit 1
fi

# Check connection
if ! curl -s --head "$SEARX_URL" >/dev/null; then
  echo "Error: SearXNG not running at $SEARX_URL"
  echo "Try: podman start searxng"
  exit 1
fi

# Fetch and format JSON results
curl -sG "$SEARX_URL" \
  -H "X-Forwarded-For: 127.0.0.1" \
  --data-urlencode "q=$QUERY" \
  --data-urlencode "format=json" \
  --data-urlencode "categories=$CATEGORY" \
| jq -r '.results[] | "\(.title)\n\(.url)\n\(.content)\n---\"' \
| head -n 20
