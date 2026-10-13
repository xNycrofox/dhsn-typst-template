---
title: Reference
---

# Reference

All functions provided by the template. Arguments without a default value in the tables are optional as well, but lead to empty spots in the document.

## Document setup

### dhsnsimple

Sets up the document and creates all parts around the content. Used as `#show: dhsnsimple.with(...)`. Described in [simple mode](./simple).

| Argument          | Type                       | Default          | Description                                             |
| ----------------- | -------------------------- | ---------------- | ------------------------------------------------------- |
| `first`           | text                       |                  | first name of the author                                |
| `last`            | text                       |                  | last name of the author                                 |
| `company`         | text                       |                  | company the author works at                             |
| `location`        | text                       |                  | location of the university                              |
| `linkcoloring`    | boolean                    | `false`          | colors links                                            |
| `header`          | boolean                    | `true`           | shows the title in the header                           |
| `headertitle`     | text                       | the title        | text of the header, should not exceed 80 characters     |
| `codetheme`       | text or `none`             | `"github-light"` | `"github-light"`, `"github-dark"` or `none`             |
| `img`             | image                      |                  | logo on the title page                                  |
| `course`          | text                       |                  | course of studies                                       |
| `title`           | text                       |                  | title of the paper                                      |
| `number`          | number or text             |                  | matriculation number                                    |
| `corrector`       | array or text              | `()`             | correctors                                              |
| `themedate`       | date or text               |                  | date when the theme was announced                       |
| `returndate`      | date or text               |                  | date when the paper is handed in                        |
| `signature`       | image                      |                  | signature of the author                                 |
| `companylocation` | text                       |                  | location of the company                                 |
| `type`            | text                       | required         | `"thesis"`, `"master-thesis"`, `"study"`, `"report"` or a custom text |
| `degreetype`      | text                       | `"Science"`      | degree type for theses                                  |
| `assignment`      | image                      | `none`           | assignment of the thesis, usually a PDF file            |
| `blocknotice`     | boolean                    | `true`           | includes the block notice                               |
| `ainotice`        | boolean                    | `false`          | includes the notice on generative AI                    |
| `aimodel`         | array or text              | `()`             | AI models used                                          |
| `gendernotice`    | boolean                    | `false`          | includes the notice on gender language                  |
| `abstract`        | content                    | `none`           | abstract                                                |
| `abstractintoc`   | boolean                    | `false`          | adds the abstract to the table of contents              |
| `acronyms`        | dictionary                 | `(:)`            | abbreviations, short form to long form                  |
| `glossary`        | dictionary                 | `(:)`            | entries of the glossary with `name` and `description`   |
| `bibliography`    | bibliography               | `none`           | `bibliography("document.bib")`                          |

The parts are created in this order: title page, assignment, block notice, AI notice, gender notice, abstract, table of contents, list of figures, abbreviations, glossary, list of tables, list of codes, **content**, bibliography, affirmation.

### dhsnarticle

Sets up page, fonts, spacing, headings, lists, captions and the citation style without creating any content. Used as `#show: dhsnarticle.with(...)`. Described in [normal mode](./normal).

Takes the arguments `first`, `last`, `company`, `location`, `linkcoloring`, `header`, `headertitle` and `codetheme` of `dhsnsimple`.

## Parts of the paper

| Function                                   | Description                                                             |
| ------------------------------------------ | ----------------------------------------------------------------------- |
| `mktitle(title, img, course, number, corrector, themedate, returndate, type, degreetype)` | title page |
| `mkblocknotice(signature, date, location)` | block notice, `location` is the location of the company                 |
| `mkainotice(model)`                        | notice on the usage of generative AI                                    |
| `mkgendernotice()`                         | notice on gender language                                               |
| `mkfrontmatter(abbreviations)`             | table of contents and lists, swaps to arabic page numbers afterwards    |
| `mkaffirmation(signature, date)`           | affirmation                                                             |

All arguments except the one of `mkfrontmatter` are named, e.g. `#mkainotice(model: ("GPT-4o",))`.

## Abbreviations and glossary

| Function                                         | Description                                                    |
| ------------------------------------------------ | -------------------------------------------------------------- |
| `newacronym(key, short, long)`                   | defines an abbreviation                                        |
| `newglossaryentry(key, name: .., description: ..)` | defines an entry of the glossary                             |
| `gls(key)`                                       | refers to an abbreviation or entry, the first use of an abbreviation prints the long form |
| `printacronyms(title: "Abkürzungsverzeichnis")`  | prints the list of used abbreviations                          |
| `printglossary(title: "Glossar")`                | prints the used entries of the glossary                        |

## Environments

| Function                                                 | Description                                   |
| -------------------------------------------------------- | --------------------------------------------- |
| `dhsnfigure(source: .., label: .., placement: ..)[caption][content]` | framed figure                       |
| `dhsntable(source: .., label: .., placement: ..)[caption][content]`  | table                               |
| `dhsncode(source: .., label: ..)[caption][content]`        | code                                          |
| `dhsnappx[content]`                                        | appendix                                      |
| `addtoappx[caption]`                                     | entry in the list of appendix entries         |
| `theappx()`                                              | number of the last appendix entry             |

Described in [environments](./environments).

## Citations

| Function                       | Description                                                |
| ------------------------------ | ---------------------------------------------------------- |
| `dhsncite(key)[pages]`           | direct citation in a footnote                              |
| `vglcite(key)[pages]`          | indirect citation in a footnote, starting with "Vgl."      |
| `captioncite(key)[pages]`      | citation without footnote for captions                     |

The key is a label like `<cloudcomp>` or text like `"cloudcomp"`. The pages are optional. Described in [citations](./citations).

## Helpers

| Function                                   | Description                                                  |
| ------------------------------------------ | ------------------------------------------------------------ |
| `today()`                                  | the current date, e.g. "13. Oktober 2026"                    |
| `format-date(date)`                        | prints a `datetime` in german, anything else is returned as is |
| `paper-type(type, degreetype: .., course: ..)` | text of the title page describing the type of the paper  |
| `ai-models(model)`                         | sentence naming the AI models                                |
| `env-caption(title, source: ..)`           | caption with source reference                                |

## Formatting applied by the template

| Property             | Value                                                            |
| -------------------- | ---------------------------------------------------------------- |
| paper                | A4, margins 3cm left, 2cm right, 3cm top (2cm without header), 2cm bottom |
| font                 | New Computer Modern, 12pt                                        |
| text                 | justified, hyphenated in german, 1.5 line spacing                |
| paragraphs           | no indentation, an empty line in between                         |
| headings             | numbered, bold, 17.28pt, 14.4pt and 12pt                         |
| page numbers         | bottom right, roman in the frontmatter, arabic afterwards        |
| header               | title of the paper with a line below                             |
| captions             | 10pt, centered, below the content                                |
| code                 | DejaVu Sans Mono, 9pt, framed, with line numbers                 |
| footnotes            | 10pt, single line spacing                                        |
| bibliography         | single line spacing, sorted by author                            |
