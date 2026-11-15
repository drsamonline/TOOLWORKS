# Toolworks

**969 tools from two catalogues, in one index.**

[![tools](https://img.shields.io/badge/tools-969-7c9cff)](#the-numbers)
[![from TTB](https://img.shields.io/badge/TTB-565-4ade80)](https://github.com/drsamonline/TTB)
[![from All4ONE](https://img.shields.io/badge/All4ONE-404-f59e0b)](https://github.com/drsamonline/All4ONE)
[![no network](https://img.shields.io/badge/network-none-98a2b3)](#what-this-is-not)

Two toolboxes were built separately: **TTB**, a browser extension with 565 tiny utilities,
and **All4ONE**, a portable Windows binary with 404. Both are good. Neither knew what the
other had. This repository is the index that does: one page, every tool, searchable, offline.

**Neither original repository is touched.** They keep their code, their history, their
licence and their users. This one only reads their catalogues.

---

## Open it

| | |
|---|---|
| The index | [`index.html`](index.html) — 969 rows, search, filter by source and group |
| The data | [`data/catalogue.json`](data/catalogue.json) — the merged catalogue, with a `source` on every tool |
| Provenance | [`SOURCES.md`](SOURCES.md) — where each half came from, and what was changed |

No server, no build step, no network. Open the file.

---

## The numbers

| | |
|---|---|
| Tools in the index | **969** |
| From TTB | 565 |
| From All4ONE | 404 |
| Groups after merging | **20** |
| Names present in both catalogues | 16 |
| Tools showing their own controls | 464 |
| Tools with a published description | 404 (All4ONE publishes them; TTB does not) |
| Overlap removed | 0 — see below |

| Group | TTB | All4ONE | Total |
|---|---:|---:|---:|
| Developer | 90 | 23 | **113** |
| Text | 62 | 40 | **102** |
| Numbers | 69 | 29 | **98** |
| Media | 36 | 46 | **82** |
| Files | — | 73 | **73** |
| System | 39 | 33 | **72** |
| Web | 56 | — | **56** |
| Data | 25 | 30 | **55** |
| Network | 22 | 24 | **46** |
| Security | 26 | 16 | **42** |
| Documents | — | 39 | **39** |
| Fun | 29 | — | **29** |
| Design | 27 | — | **27** |
| Encoding | — | 27 | **27** |
| Generators | — | 24 | **24** |
| Finance | 20 | — | **20** |
| Productivity | 19 | — | **19** |
| Unique | 18 | — | **18** |
| Learning | 15 | — | **15** |
| Accessibility | 12 | — | **12** |

---

## What merging actually meant

The two catalogues use different vocabularies. TTB has *Calculators & Converters* and
*Page Tools*; All4ONE has *Numbers* and *PDF*. Merging them was three decisions:

| Decision | What was done | Why |
|---|---|---|
| Categories | 34 categories collapsed to **20** groups | a reader wants one word per shelf, not two vocabularies |
| Duplicates | **nothing was dropped** | 16 names appear in both, and they are not the same tool: TTB's *Case converter* runs in a browser, All4ONE's runs on a file on disk. Both stay, labelled with their source |
| Ids | kept exactly as each project wrote them | an id is how someone finds the tool in the project that owns it |

---

## What this is not

| Not | Why |
|---|---|
| Not a reimplementation | every tool still runs in the project it came from. This is an index |
| Not a replacement | TTB and All4ONE are unchanged and remain the places to install from |
| Not a network app | one HTML file, no fetch, no analytics |
| Not a promise of parity | a name in both catalogues is two different tools, and the index says which is which |

---

## Support

Toolworks is free for personal, academic, hobby and non-profit use. If it saved you a
search, the usual shapes are below, and the first one costs nothing.

| | |
|---|---|
| UPI (India) | `drsohilboi@ybl` — payee Dr Sohil Momin, open amount |
| GitHub Sponsors | [github.com/sponsors/drsamonline](https://github.com/sponsors/drsamonline) |
| Ko-fi | [ko-fi.com/matneo](https://ko-fi.com/matneo) |
| PayPal | [paypal.me/drsohilmomin](https://paypal.me/drsohilmomin?locale.x=en_GB&country.x=IN) |
| My books | [Amazon author store](https://www.amazon.com/stores/author/B08ZT331LY/allbooks) |
| More apps | [drsamonline.github.io](https://drsamonline.github.io/) |
| Email | [sohilmomin2000@gmail.com](mailto:sohilmomin2000@gmail.com) |

The best support is to use one of the tools and report what broke.

---

## Windows

| Way | What it is |
|---|---|
| double-click `index.html` | the whole app. One file, no install |
| [`windows/`](windows/) | a launcher and a PowerShell server, for a phone on your Wi-Fi or an app install |

There is no `.exe`, deliberately: the page is the program, and an exe would be a browser
wrapped around it, larger and slower. `windows/README-WINDOWS.md` says the same thing at
more length, including what the server will not do.

## Checks

`python3 tools_check.py` reads the catalogue and the page and asserts fourteen things:
the count matches the list, the page lists every tool and nothing else, every id is unique,
every tool has a group, and — the ones that keep the privacy policy honest — the page has
**no network code and no storage**. CI runs it on every push, with no dependencies installed.

## Documents

| File | What it answers |
|---|---|
| [SOURCES.md](SOURCES.md) | where every tool came from, and what the merge changed |
| [CHANGELOG.md](CHANGELOG.md) | every version, and the decisions behind it |
| [CONTRIBUTING.md](CONTRIBUTING.md) | what is welcome here, and what is not |
| [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) | the short version: be decent |
| [SECURITY.md](SECURITY.md) | how to report a problem privately, and what this repo cannot do to you |
| [PRIVACY.md](PRIVACY.md) | it collects nothing, and here is the proof |
| [LICENSE](LICENSE) | PolyForm Noncommercial 1.0.0 |

## Licence

[PolyForm Noncommercial 1.0.0](LICENSE), the same licence as both source projects.
Commercial use needs a written licence: ask.

Copyright 2026 Dr Sohil Momin.

---

## Where the tools live

| Project | Shape | Install |
|---|---|---|
| [TTB](https://github.com/drsamonline/TTB) | a browser extension | load the folder as an unpacked extension |
| [All4ONE](https://github.com/drsamonline/All4ONE) | a portable Windows binary | download the release, run it |
| **Toolworks** (this) | an index | open `index.html` |
