# Toolworks on Windows

The index is **one HTML file**. There is nothing to install, no runtime, no admin rights,
and no network connection needed. Pick whichever of the three ways suits you.

---

## 1. Double-click — the simplest

| Step | |
|---|---|
| 1 | Unzip this folder anywhere, including a USB stick |
| 2 | Double-click **`Toolworks.cmd`** |
| 3 | Your default browser opens the index |

`Toolworks.cmd` does one thing: `start "" "index.html"`. If your browser is already the
default for `.html` files, you can skip it and double-click `index.html` directly.

**Works on:** Windows 7, 8, 10, 11. Edge, Chrome, Firefox, Brave — anything from the last
decade, because the page is plain HTML, CSS and JavaScript with no build step.

---

## 2. Serve it — to open it on your phone, or install it as an app

| Step | |
|---|---|
| 1 | Double-click **`Toolworks-Serve.cmd`** |
| 2 | It prints two addresses: one for this PC, one for a phone on the same Wi-Fi |
| 3 | Press `Ctrl+C` in that window to stop it |

The server is `serve.ps1`, about 80 lines of PowerShell using `System.Net.HttpListener` —
the .NET Framework that ships with Windows. **No Python, no Node, no downloads.**

It serves one folder, read-only, and refuses any path outside it. It is not a web server;
it is a way to hand one page to another device on your own network.

Windows Firewall may ask once. Allow it on **private networks** only.

---

## 3. Just open the file

`index.html` is self-contained. Drag it into any browser window, or copy it to a phone and
open it there. Everything works: search, the source filter, the group filter.

---

## What is in this folder

| File | What it is |
|---|---|
| `index.html` | the index: 969 tools, one page, no network |
| `data/catalogue.json` | the catalogue the page is built from |
| `Toolworks.cmd` | open the index in the default browser |
| `Toolworks-Serve.cmd` | serve it on the local network, for a phone or an install |
| `serve.ps1` | the PowerShell server the previous file runs |
| `LICENSE` | PolyForm Noncommercial 1.0.0 |
| `README-WINDOWS.md` | this file |

---

## Honest limits

| | |
|---|---|
| There is **no `.exe`** | this is a web page, not a program. An exe would be a browser with a page inside it, and it would be larger and slower than the page |
| No installer | unzip and go. Nothing is written to the registry or to `Program Files` |
| No auto-update | the index is a snapshot. Take a newer one from the repository when you want it |
| `serve.ps1` is not hardened for the public internet | it is for your own Wi-Fi. Do not port-forward it |

---

## Where this came from

[github.com/drsamonline/TOOLWORKS](https://github.com/drsamonline/TOOLWORKS) — 969 tools
merged from [TTB](https://github.com/drsamonline/TTB) and
[All4ONE](https://github.com/drsamonline/All4ONE). Neither original is modified.
