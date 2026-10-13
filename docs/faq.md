---
title: FAQ
---

# FAQ

## Compilation

### file not found

Paths are relative to the file they are written in. `image("images/logo.png")` in `chapters/basics.typ` looks for `chapters/images/logo.png`.
Use `../images/logo.png` or a path starting at the directory of the main file like `/images/logo.png`.

### access denied / file is outside of the project root

Typst only reads files within the directory of the main file. Pass a directory further up with `typst compile --root .. document.typ` if files next to that directory are required.

### package not found (searched for @local/dhsnarticle:0.1.0)

The template is not located in the directory for local packages or the directory has a wrong name. The file `typst.toml` has to be located directly in `.../typst/packages/local/dhsnarticle/0.1.0/`. See [template setup](setup/template.md).

### label does not exist in the document

A reference like `@name` points to a label, which is not defined. Labels of figures, tables and codes are set with the `label` argument and default to the caption. A caption with spaces has to be referred to with `#ref(label("the caption"))`.

### label occurs multiple times in the document

Two elements share a label, e.g. two figures with the same caption and no `label` argument, or a figure and a source of the bibliography. Give one of them another `label`.

### unknown variable

A function of the template is used in a file without `#import "@local/dhsnarticle:0.1.0": *` at the top. Each file needs the import.

### unknown font family

The fonts "New Computer Modern" and "DejaVu Sans Mono" are part of the compiler. This warning only appears with a compiler built without embedded fonts, e.g. from some linux distributions. Install the fonts or use the official release.

### layout did not converge within 5 attempts

The page numbers in the lists depend on the length of the lists themselves. Rarely a document flips between two states. Adding a `#pagebreak()` in front of the affected part solves it.

## Content

### `?key?` is printed in red

`#gls("key")` refers to an abbreviation or entry of the glossary, which is not defined. Check the keys of `acronyms` and `glossary`.

### An abbreviation is missing in the list of abbreviations

The list contains only abbreviations, which are used with `gls` at least once.

### The list of figures, tables or codes is missing

Lists without an entry are omitted. Only `dhsnfigure`, `dhsntable` and `dhsncode` outside of the appendix add entries.

### A special character disappears or breaks the compilation

`#`, `*`, `_`, `@`, `$`, `<` and backticks have a meaning in Typst. Put a backslash in front of them, e.g. `\#` or `user\@example.org`. Within text in quotation marks only `"` and `\` need a backslash.

### Two footnotes directly behind each other look like one number

Separate them with `#super[,]`, e.g. `#vglcite(<a>)#super[,]#vglcite(<b>)`.

### "ebenda" is printed although the source is cited the first time on that page

The template cannot know on which page a footnote ends up. Check these cases at the very end and force the full citation by citing with different pages or reordering.
See [citations](usage/citations.md).

### The title does not fit into the header

Use `headertitle: "A shorter title"` or `header: false`.

### Why is the title printed at the top of every page?

This is the behavior of the LaTeX template, which puts the title into the header by default. `header: false` removes the header.

### Why are figures framed, even in the appendix?

`dhsnfigure` always draws a frame around its content, like `bafigure` of the LaTeX template. Put content, which should not be framed, into a `dhsntable` or directly into the document.

### A table or figure should break across pages

`dhsnfigure` and `dhsntable` keep their content on one page. Split the content or put a `table` directly into the document.

## Output

### How to create a PDF/A file?

`typst compile --pdf-standard a-2b document.typ`

### How to export a single page as image?

`typst compile --pages 1 --ppi 150 document.typ title.png`

### How to change something the template defines?

Put set and show rules after the show rule of the template, e.g. `#set text(font: "Libertinus Serif")` to change the font. Keep in mind that the paper may not follow the styleguide anymore.

### How to get a newer version of the template?

Install the new version from the [Releases](https://github.com/xNycrofox/dhsn-typst-template/releases) page next to the old one and change the version in the import, see [template setup](setup/template.md).
