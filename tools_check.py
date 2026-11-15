#!/usr/bin/env python3
"""Check the index against its own catalogue and its own documents.

    python3 tools_check.py            # report; exit 1 on a problem
    python3 tools_check.py --json     # machine-readable

Every claim here is checkable from the files in this repository, which is the only
reason to state it. Nothing is asserted about the two source projects beyond what
their catalogues published.
"""
from __future__ import annotations

import json
import os
import re
import sys

ROOT = os.path.dirname(os.path.abspath(__file__))
DOCS = ["SOURCES.md", "CHANGELOG.md", "CONTRIBUTING.md", "CODE_OF_CONDUCT.md",
        "SECURITY.md", "PRIVACY.md", "LICENSE"]
NETWORK = ["fetch(", "XMLHttpRequest", "sendBeacon", "new WebSocket", "import("]
STORAGE = ["localStorage", "sessionStorage", "indexedDB", "document.cookie"]


def load():
    return json.load(open(os.path.join(ROOT, "data", "catalogue.json"), encoding="utf-8"))


def check() -> list[tuple[bool, str]]:
    out: list[tuple[bool, str]] = []
    cat = load()
    tools = cat["tools"]
    html = open(os.path.join(ROOT, "index.html"), encoding="utf-8").read()
    readme = open(os.path.join(ROOT, "README.md"), encoding="utf-8").read()

    out.append((cat["count"] == len(tools),
                f"the count field matches the tools list ({cat['count']} vs {len(tools)})"))

    # count rows, not the two filter buttons that also carry data-src
    rows = len(re.findall(r'<tr data-src="', html))
    out.append((rows == len(tools), f"the page lists every tool ({rows} rows vs {len(tools)} tools)"))

    sources = {t["source"] for t in tools}
    out.append((sources == {"ttb", "all4one"}, f"every tool names a known source ({sorted(sources)})"))

    ids = [t["id"] for t in tools]
    out.append((len(ids) == len(set(ids)), "no id appears twice"))

    out.append((all(t.get("group") for t in tools), "every tool has a group"))
    out.append((len({t["group"] for t in tools}) == 20,
                f"20 groups ({len({t['group'] for t in tools})} found)"))

    # the page must not be able to talk to anything, or the privacy policy is a lie
    hits = [k for k in NETWORK if k in html]
    out.append((not hits, f"the page has no network code ({hits or 'none'})"))
    hits = [k for k in STORAGE if k in html]
    out.append((not hits, f"the page stores nothing ({hits or 'none'})"))
    out.append(('src="http' not in html, "no asset is loaded from another host"))

    # the documents the estate's other repos all carry
    missing = [d for d in DOCS if not os.path.exists(os.path.join(ROOT, d))]
    out.append((not missing, f"every document is present ({missing or 'all'})"))

    linked = [d for d in DOCS if d != "LICENSE" and d not in readme]
    out.append((not linked, f"the README links its documents ({linked or 'all'})"))

    # the README's counts must match the catalogue, the same way KILN's do
    m = re.search(r"\*\*(\d+) tools from two catalogues", readme)
    out.append((bool(m) and int(m.group(1)) == len(tools),
                f"the README's tool count matches ({m.group(1) if m else 'not found'})"))

    for src, key in (("ttb", 565), ("all4one", 404)):
        n = sum(1 for t in tools if t["source"] == src)
        out.append((n == key, f"{src} contributes {key} ({n})"))

    return out


def main() -> int:
    rows = check()
    bad = [r for r in rows if not r[0]]
    if "--json" in sys.argv:
        print(json.dumps({"checks": [{"ok": ok, "name": n} for ok, n in rows],
                          "failed": len(bad)}, indent=1))
    else:
        for ok, name in rows:
            print(("  ok   " if ok else "  FAIL ") + name)
        print(f"\n{len(rows) - len(bad)} of {len(rows)} checks pass")
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main())
