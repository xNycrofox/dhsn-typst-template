---
title: Typst Basics
---

# Typst Basics

This page explains the parts of Typst required to write a paper with this template.
The official [tutorial](https://typst.app/docs/tutorial/) and the [reference](https://typst.app/docs/reference/) cover everything in depth.

## How Typst works

A paper is written in plain text files with the `.typ` extension.
The Typst compiler reads the main file, e.g. `document.typ`, and creates `document.pdf` from it.
The table of contents, all lists, footnotes and the bibliography are created during that single run.
There are no auxiliary files and nothing has to be executed twice.

```text
somedirectory
|-document.bib      the sources you cite
|-document.typ      the main file, compiled with "typst compile document.typ"
|-chapter1.typ      optional files, joined in the main file with #include
|-images|-...       images used in the paper
```

The compiler only reads files inside the directory of the main file, the so-called project root.
Paths are always relative to the file they are written in. A path starting with `/` is relative to the project root.

## Markup

Text is written as it is. An empty line starts a new paragraph.
A few characters have a special meaning:

```typst
= Section
== Subsection
=== Subsubsection

Text with *bold* and _italic_ parts and "quotation marks".
A line break is forced with a backslash \
and a comment starts with two slashes. // not part of the document

- an item of a list
- another item

+ an item of a numbered list
+ another item

Inline code like `print()` and math like $a^2 + b^2 = c^2$.
```

The template takes care of the formatting. Headings are numbered and added to the table of contents, quotation marks are converted to german ones and words are hyphenated in german.
Characters with a special meaning, like `#`, `*`, `_`, `@`, `$` and `<`, can be written by putting a backslash in front of them, e.g. `\#`.

## Functions

Everything beyond simple markup is done with functions. In markup a function is called with a `#` in front of its name.
Arguments are given in parentheses. Named arguments have the form `name: value`.
Content is written in square brackets and can also be appended after the parentheses.

```typst
#pagebreak()
#image("images/diagram.png", width: 14cm)
#footnote[The content of the footnote.]
// two content arguments, the caption and the figure itself
#dhsnfigure(source: [Company])[The caption][
  #image("images/diagram.png")
]
```

The values used most often are:

- text in quotation marks: `"thesis"`
- content in square brackets, which may contain markup: `[The *title*]`
- numbers and lengths: `1234`, `14cm`, `12pt`, `50%`
- booleans: `true` and `false`
- arrays: `("corrector1", "corrector2")`. An array with a single entry requires a trailing comma: `("corrector1",)`
- dictionaries: `(HTTP: "Hypertext Transfer Protocol")`

## Importing the template

A document gains access to the functions of the template with an import at the very top.
Each file, which uses functions of the template, needs that import.

```typst
// if the template is installed as local package
#import "@local/dhsnarticle:0.1.0": *
// if the files of the template are located next to the document
#import "lib.typ": *
```

The template is applied to the whole document with a show rule.
Everything after that line is formatted by the template.
`.with(...)` passes the options to the template.

```typst
#show: dhsnsimple.with(
  first: "firstname",
  last: "lastname",
  ...
)
```

## Labels and references

A label is attached to a heading by writing `<name>` behind it.
`@name` creates a reference to it. Sources of the bibliography are cited the same way.

```typst
= Introduction <intro>
As described in @intro ...
```

## Adjusting the formatting

The defaults of every function can be changed with set rules, which is rarely required as the template implements the styleguide.
Put them after the show rule of the template.

```typst
#show: dhsnsimple.with(...)
// e.g. use thinner lines in all tables
#set table(stroke: 0.4pt)
```

## Packages

Additional functionality is provided by packages listed on [Typst Universe](https://typst.app/universe/).
A package is downloaded automatically when it is imported for the first time, e.g. `#import "@preview/cetz:<version>"` with the version shown on its page.
Some suggestions can be found in the [packages](./packages) section.

## Compiling

- `typst compile document.typ` creates `document.pdf`
- `typst watch document.typ` recompiles the document whenever a file changes
- `typst fonts` lists all fonts Typst can use
- `typst init @local/dhsnarticle:0.1.0 somedirectory` creates a new paper from the template

Errors are reported with the file, line and a description. If there is an error no PDF file is created.
Editors with the Tinymist extension and the [Typst web app](https://typst.app) show a live preview and the errors while typing.
