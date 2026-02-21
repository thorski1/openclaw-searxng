---
name: searxng
description: Search the web using a local SearXNG instance (privacy-focused meta-search engine). Use this when API limits are hit or for uncensored/aggregated results.
homepage: https://github.com/thorski1/openclaw-searxng
metadata:
  {
    "openclaw":
      {
        "emoji": "🔍",
        "requires": { "bins": ["curl", "jq"] },
        "install":
          [
            {
              "id": "podman",
              "kind": "brew",
              "formula": "podman",
              "bins": ["podman"],
              "label": "Install Podman (container runtime)",
            },
            {
              "id": "searx-script",
              "kind": "script",
              "label": "SearXNG Wrapper",
              "files": ["searx.sh"],
            },
          ],
      },
  }
---

# searxng

Search the web using a local SearXNG instance running via Podman/Docker.

## Setup (First Run)

1.  Ensure Podman is installed (`brew install podman`).
2.  Start the Podman machine: `podman machine init && podman machine start`.
3.  Run the SearXNG container:
    ```bash
    podman run -d --rm --name searxng -p 8080:8080 -e "BASE_URL=http://localhost:8080/" searxng/searxng
    ```

## Usage

### Basic Search

```bash
searx "query string"
```

### Advanced (with categories)

```bash
searx "query string" --category news
```
