# Privacy

**Version** 1.0 · **Effective** 15 November 2026 · **Owner** Dr Sohil Momin · **Applies to** the Toolworks index (`index.html`) and its catalogue data.

---

## The short version

Toolworks is a page that lists tools. It collects nothing, because it has nothing to collect
with: no analytics, no telemetry, no accounts, no cookies and no network code.

---

## What this repository does with data

| Question | Answer |
|---|---|
| Does the page send anything anywhere? | No. There is no `fetch`, no script from another host, and no image loaded from a CDN |
| Does it phone home on first run? | No |
| Does it create an account or identifier? | No |
| Does it store anything on your device? | No. It does not use `localStorage`, cookies or IndexedDB |
| Does it log what you do? | No |
| Does it know which tool you clicked? | It cannot. The filters run in the page, and nothing is reported |

## What the catalogue contains

`data/catalogue.json` holds tool names, ids, categories and the descriptions the two source
projects publish. It holds **no personal data of any kind** — no user records, no usage
figures, no names of anyone who used a tool.

## The two projects it indexes

Clicking a tool takes you to the project that owns it, and that project's privacy policy
applies from there:

| Project | Policy |
|---|---|
| TTB | [PRIVACY.md](https://github.com/drsamonline/TTB/blob/main/PRIVACY.md) |
| All4ONE | [PRIVACY.md](https://github.com/drsamonline/All4ONE/blob/main/PRIVACY.md) |

## If you host this page yourself

Serving `index.html` from a web server means that server sees requests, as every web server
does. That is your server's log, not this project's, and this project ships no server.

## Changes

This file changes only when the answer above changes. The date at the top is the last change.

## Contact

sohilmomin2000@gmail.com — subject line `Toolworks privacy`.
