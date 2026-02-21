# OpenClaw SearXNG Skill (Local)

This skill provides a private, censorship-resistant web search tool for OpenClaw by wrapping a local SearXNG container.

## Features

- **No API Limits:** Bypasses Brave/Google paid API limits.
- **Privacy:** Proxies requests through a local SearXNG instance.
- **Aggregated Results:** Combines Google, Bing, DuckDuckGo, Wikipedia, etc.
- **Zero Tracking:** Searches are anonymous.

## Prerequisites

- **Podman** or **Docker** (installed via Homebrew or Docker Desktop).
- **OpenClaw** (running locally).

## Installation

### 1. Install Podman (if needed)

```bash
brew install podman
podman machine init
podman machine start
```

### 2. Run SearXNG Container

```bash
podman run -d --name searxng -p 8080:8080 -e "BASE_URL=http://localhost:8080/" searxng/searxng
```

### 3. Add Skill to OpenClaw

Copy `searx` folder to `~/.openclaw/skills/` or symlink it:

```bash
ln -s $(pwd) ~/.openclaw/skills/searx
```

## Usage

Use the `searx` tool in OpenClaw:

```bash
searx "query string"
searx "query string" --category news
```
