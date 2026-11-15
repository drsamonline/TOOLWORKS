# Contributing

Thank you for looking. This repository is an index, so the contributions that matter are
different from a code project's.

---

## What is welcome

| Contribution | What it looks like |
|---|---|
| **A wrong entry** | a tool whose name, id, category or source is incorrect. This is the most valuable report |
| **A missing tool** | a tool that exists in TTB or All4ONE and is not in the index |
| **A category that does not fit** | the 34 source categories collapse to 20 groups; if one reads wrong, say which and why |
| **A description** | only if it is the text the owning project publishes. This index does not write its own |
| **A UI fix** | the page is one file with no dependencies; keep it that way |

## What is not welcome

| Not this | Why |
|---|---|
| reimplementing a tool here | every tool runs in the project that owns it. This is an index |
| inventing a description | TTB publishes none for most tools, and a dash is honest where a guess is not |
| dropping a duplicate | the 16 names that appear in both catalogues are different tools |
| adding a dependency, a build step or a network call | the page is one file that works offline |
| reformatting the whole catalogue | it makes the real change impossible to read |

---

## The four-step rule

Every change must pass these before it is merged:

| Step | Check |
|---|---|
| 1 | `python3 -c "import json;json.load(open('data/catalogue.json'))"` — the catalogue parses |
| 2 | the count in `data/catalogue.json` matches the number of tools in it |
| 3 | `index.html` lists every tool in the catalogue, and nothing else |
| 4 | opening `index.html` still filters by source, group and search |

---

## How the catalogue is built

`data/catalogue.json` is the source of truth. It is produced by reading the two source
projects and merging their catalogues, and `SOURCES.md` records every decision that merge
makes. A change to a tool's data is a change to that file; `index.html` follows it.

## Reporting a problem with a tool

If a tool is broken, that is a bug in **TTB** or **All4ONE**, not here. Open it where the
tool lives:

- [TTB issues](https://github.com/drsamonline/TTB/issues)
- [All4ONE issues](https://github.com/drsamonline/All4ONE/issues)

## Licence

By contributing you agree your change is licensed under the same
[PolyForm Noncommercial 1.0.0](LICENSE) as the rest of the repository.
