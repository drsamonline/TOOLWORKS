# Security policy

**Version** 1.0 · **Effective** 15 November 2026

---

## Reporting a vulnerability

**Please do not open a public issue for a security problem.**

| Channel | Detail |
|---|---|
| Email | sohilmomin2000@gmail.com — subject line `Toolworks security` |
| GitHub | [private vulnerability report](https://github.com/drsamonline/TOOLWORKS/security/advisories/new) |
| What to include | the commit, what you did, what happened, and what you expected |

You will get an acknowledgement within a few days. There is no bounty and no formal SLA;
this is a single-maintainer project, and saying so is better than promising otherwise.

## Scope

| In scope | Why |
|---|---|
| `index.html` — the index page | it is the only executable surface in this repository |
| `data/catalogue.json` — the catalogue | a wrong entry sends a reader to the wrong tool |
| the merge in `SOURCES.md` | a mislabelled tool is a provenance failure, which is the failure this repo exists to avoid |

**Out of scope:** the security of TTB and All4ONE themselves. This repository does not contain
their code. Report a problem in a tool to the project that ships it.

## What this repository cannot do to you

| Claim | Why it holds |
|---|---|
| it cannot exfiltrate data | it has no network code at all — no `fetch`, no `XMLHttpRequest`, no `sendBeacon` |
| it cannot track you | no storage, no cookies, no analytics |
| it cannot run a tool | every tool stays in its own project; this is an index |

## Supported versions

There is one line of development, on `main`. A fix lands there; there are no maintenance
branches to backport to.

## How this file is kept honest

The three claims in the table above are checked by reading the page, not by trusting this
document. If a future change adds a `fetch`, the claim becomes false and this file must change
with it.
