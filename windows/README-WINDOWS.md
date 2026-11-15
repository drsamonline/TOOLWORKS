# Toolworks on Windows

The index is **one HTML file**. There is nothing to install, no runtime, no admin rights,
and no network connection needed.

---

## Two steps

| Step | |
|---|---|
| 1 | Unzip this folder anywhere, including a USB stick |
| 2 | Double-click **`Toolworks.cmd`** |

Your default browser opens the index. `Toolworks.cmd` does one thing:

    start "" "%~dp0index.html"

If `.html` files are already associated with a browser you like, you can skip the launcher
and double-click `index.html` directly.

**Works on:** Windows 7, 8, 10, 11. Edge, Chrome, Firefox, Brave — anything from the last
decade, because the page is plain HTML, CSS and JavaScript with no build step.

---

## What is in this folder

| File | What it is |
|---|---|
| `index.html` | the index: 969 tools, one page, no network |
| `data/catalogue.json` | the catalogue the page is built from |
| `Toolworks.cmd` | opens the index in the default browser |
| `LICENSE` | PolyForm Noncommercial 1.0.0 |
| `README-WINDOWS.md` | this file |

---

## Honest limits

| | |
|---|---|
| There is **no `.exe`** | this is a web page, not a program. An exe would be a browser with a page inside it — larger, slower, and a second thing to update |
| There is **no local server** | one was written and then removed: it was untested on Windows, and a Windows user who wants it has `python -m http.server` or any of a hundred tools. Shipping unrun code to serve one file is not worth the risk |
| No installer | unzip and go. Nothing is written to the registry or to `Program Files` |
| No auto-update | the index is a snapshot. Take a newer one from the repository when you want it |
| No phone access | opening it on a phone needs a server. Copy `index.html` to the phone instead, or use the hosted copy |

---

## Opening it on a phone instead

Two ways that need no server from this folder:

| Way | How |
|---|---|
| Copy the file | send `index.html` to the phone and open it in the browser |
| Use the hosted copy | [drsamonline.github.io/TOOLWORKS](https://drsamonline.github.io/TOOLWORKS/) |

---

## Where this came from

[github.com/drsamonline/TOOLWORKS](https://github.com/drsamonline/TOOLWORKS) — 969 tools
merged from [TTB](https://github.com/drsamonline/TTB) and
[All4ONE](https://github.com/drsamonline/All4ONE). Neither original is modified.
