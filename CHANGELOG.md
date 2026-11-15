# Changelog

Every version, what changed, and why. The index is small; this file stays small with it.

---

## v1.1.1 — 2026-11-15

The PowerShell server is gone. The launcher stays.

| Area | Change |
|---|---|
| **Removed** | `windows/serve.ps1` and `windows/Toolworks-Serve.cmd`. The server was 80 lines of PowerShell that had **never been executed on Windows** — there was no Windows or PowerShell in the build environment. Shipping unrun code to serve one file is not a risk worth taking |
| Kept | `windows/Toolworks.cmd`, one line: `start "" "index.html"`. That is the whole Windows story |
| Replaced by | nothing needed. A Windows user who wants a server has `python -m http.server`; a phone can take the file itself, or the hosted copy |
| Checker | 20 checks. Two new ones assert the absence: no `serve.ps1` and no `.exe`, because a stray one would contradict the README and the release notes at once |

## v1.1.0 — 2026-11-15

A Windows package, and the checks that keep it honest.

| Area | Change |
|---|---|
| Added | `windows/` — a launcher, a local server and a guide, so the index runs on Windows with nothing installed |
| Added | `windows/serve.ps1` — about 80 lines of PowerShell using `System.Net.HttpListener`, which ships with Windows. No Python, no Node, no download |
| Decision | **no `.exe`.** The page is the program; an exe would be a browser wrapped around it, larger and slower. `README-WINDOWS.md` says so plainly |
| Checker | 21 checks now, seven of them on the Windows package: both `.cmd` files exist, both use CRLF, the launcher opens `index.html` |

## v1.0.0 — 2026-11-15

The first version: 969 tools from two catalogues, in one index.

| Area | Change |
|---|---|
| Added | `data/catalogue.json` — 969 tools, 565 from TTB and 404 from All4ONE, each labelled with its source |
| Added | `index.html` — one page, 969 rows, search, filter by source and by group, no network |
| Added | `SOURCES.md` — where each half came from, the category map, and the 16 names that appear in both catalogues |
| Decision | **nothing was dropped as a duplicate.** The 16 shared names are different tools: one runs in a browser tab, the other runs on a file on disk |
| Decision | 34 source categories collapsed to 20 groups, so a reader has one word per shelf |
| Decision | where a project publishes no description, the cell shows a dash. 464 tools show the controls their own project declares |
| Note | neither TTB nor All4ONE was modified. No file was copied out of either |

---

## How this file is kept

A version is added when the catalogue changes or the page changes, not when a document changes.
The counts in the README are checked against `data/catalogue.json`, so a version that changes
the number of tools must change them both.
