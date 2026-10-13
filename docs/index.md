---
layout: home
title: DHSN Typst Template
hero:
  name: DHSN Typst Template
  text: Papers and theses following the DHSN Dresden styleguide
  tagline: Title page, notices, lists, citations with "ebenda" and bibliography from a single function. Compiled within milliseconds.
  image:
    src: /examples/title.png
    alt: Title page created by the template
  actions:
    - theme: brand
      text: Quick Start
      link: /quickstart
    - theme: alt
      text: Typst Basics
      link: /usage/basics
    - theme: alt
      text: Examples
      link: /examples/
    - theme: alt
      text: GitHub
      link: https://github.com/xNycrofox/dhsn-typst-template
features:
  - title: Everything around the content
    details: Title page, block notice, notices on generative AI and gender language, abstract, affirmation and the assignment of the thesis.
    link: /usage/simple
  - title: Lists without effort
    details: Table of contents, lists of figures, tables, codes, abbreviations and a glossary, which are only created if they have an entry.
    link: /usage/environments
  - title: Citations done right
    details: Footnotes with "Vgl." and "ebenda" and a matching bibliography, created from a .bib file.
    link: /usage/citations
  - title: Snippets to copy
    details: Figures next to each other, tables, code from files, math, landscape pages and more in the cookbook.
    link: /examples/cookbook
  - title: No dependencies
    details: A single run of a single program creates the PDF. Works offline, in VS Code and in the Typst web app.
    link: /setup/typst
  - title: Coming from LaTeX
    details: The counterpart of the DHSN Dresden LaTeX template with a table translating every command.
    link: /migration
---

## About

A template, which tries to follow the
[DHSN Dresden Styleguide](https://dresden.ba-sn.de/fileadmin/M3__BA_Dresden/downloads/zentrale-dokumente/Leitfaden_wissentschaftliche_Arbeiten.pdf)
as close as possible.
It is the Typst counterpart of the [DHSN Dresden LaTeX template](https://github.com/ba-dresden/ba-latex-template), with which papers and bachelors theses have already passed assessments.
Built with love and sane defaults by [Nuckal777](https://github.com/Nuckal777).
Minor adjustments come from Steffen Greiffenberg [sgreiffenberg](https://github.com/sgreiffenberg).
If this template served you well, do not forget to click the star button on
[GitHub](https://github.com/xNycrofox/dhsn-typst-template).
It will be appreciated.

::: warning
The template might do things wrong and there is no warranty. It is your own responsibility to check for correctness.
:::

It gets as simple as shown below.
The code creates a document containing a title page, block notice, table of contents, figures, abbreviations, tables,
a bibliography and an affirmation statement, while setting up correct spacing and page numbering.
Anyway the template is rather customizable, if desired.
The result looks like this ([PDF](https://xnycrofox.github.io/dhsn-typst-template/examples/simple.pdf)):

[![Pages of the example document](/examples/simple.png)](https://xnycrofox.github.io/dhsn-typst-template/examples/simple.pdf)

Hooked? Head over to the [quick start](quickstart.md).
New to Typst? The [Typst basics](./usage/basics) explain everything needed to write a paper.
Coming from the LaTeX template? Read the [migration guide](migration.md).

```typst
#import "@local/dhsnarticle:0.1.0": *

#show: dhsnsimple.with(
  first: "firstname",
  last: "lastname",
  company: "comp",
  location: "Dresden",
  img: image("images/logo.png"),
  course: "thecourse",
  title: "The title",
  number: 1234567,
  corrector: ("corrector1", "corrector2"),
  themedate: today(),
  returndate: today(),
  signature: image("images/signature.png"),
  companylocation: "Dresden",
  type: "thesis",
)

= Caption
Here is the content of paper.
```
