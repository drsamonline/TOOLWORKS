# Sources

Where every tool in this index came from, and what was done to it.

---

## The two catalogues

| | TTB | All4ONE |
|---|---|---|
| Repository | [drsamonline/TTB](https://github.com/drsamonline/TTB) | [drsamonline/All4ONE](https://github.com/drsamonline/All4ONE) |
| Version read | 0.13.0 | 4.1.0 |
| Shape | a browser extension | a portable Windows binary |
| Tools | 565 | 404 |
| Categories | 18 | 16 |
| Catalogue source | `data/tools.js` — a JSON array, `globalThis.TTB_CATALOG` | `TOOL_CATALOG.md` — generated from the live registry by `scripts/catalogue.py` |
| Descriptions | **none published.** 63 of its tools declare their controls in `data/inputs.js`, and those are shown | one line per tool, published in the catalogue |
| Licence | PolyForm Noncommercial 1.0.0 | PolyForm Noncommercial 1.0.0 |

Both are read, never modified. No file from either repository is copied into this one:
`data/catalogue.json` carries ids, names, categories and, for All4ONE, the one-line
description the catalogue already publishes.

---

## What was changed

| Change | Detail |
|---|---|
| Merged | the two lists into one, 969 rows |
| Grouped | 34 source categories mapped to 20 groups (see below) |
| Labelled | every tool carries `"source": "ttb"` or `"source": "all4one"` |
| Enriched | 464 tools show the controls their own project declares. Where a project publishes neither a description nor controls, the cell says **—** and nothing is invented |
| Kept | every id exactly as its own project wrote it |
| Dropped | nothing |

---

## Names that appear in both catalogues

16 names appear in both. They are not the same tool, so both are kept and
labelled: one runs in a browser tab, the other runs on a file on disk.

| Name | TTB id | All4ONE id |
|---|---|---|
| Lorem ipsum | text-writing-lorem-ipsum | lorem-ipsum |
| Morse code | text-writing-morse-code | morse-code |
| Word frequency | text-writing-word-frequency | word-frequency |
| Keyword density | text-writing-keyword-density | keyword-density |
| Compound interest | calculators-converters-compound-interest | compound-interest |
| Simple interest | calculators-converters-simple-interest | simple-interest |
| Date difference | calculators-converters-date-difference | date-diff |
| Time zone converter | calculators-converters-time-zone-converter | timezone-convert |
| Unit converter | calculators-converters-unit-converter | unit-convert |
| Roman numerals | calculators-converters-roman-numerals | roman |
| Statistics | calculators-converters-statistics | statistics |
| Regex tester | developer-regex-tester | regex-tester |
| File type detector | media-files-file-type-detector | file-type-detect |
| Duplicate finder | data-duplicate-finder | find-duplicates |
| Subnet calculator | network-subnet-calculator | ip-calc |
| Number to words | calculators-converters-number-to-words | number-words |

---

## The category map

| Source category | Group |
|---|---|
| Text & Writing, Text | Text |
| Calculators & Converters, Numbers | Numbers |
| Data | Data |
| Files, Archives, Disk | Files |
| Media & Files, Media, Images | Media |
| PDF, Documents | Documents |
| Design & Color | Design |
| Encoding | Encoding |
| Developer | Developer |
| Security | Security |
| Network, Communication | Network |
| System & Browser, System | System |
| SEO, Page Tools | Web |
| Accessibility | Accessibility |
| Education | Learning |
| Finance | Finance |
| Productivity | Productivity |
| Generators | Generators |
| Fun & Misc | Fun |
| Unique | Unique |

---

## Rebuilding the index

`data/catalogue.json` is the source of truth for this repository. `index.html` is generated
from it. When either source project publishes a new catalogue, the merge is re-run and both
files are replaced; nothing else changes.
