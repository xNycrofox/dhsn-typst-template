---
title: Migrating from LaTeX
---

# Migrating from LaTeX

This template is the counterpart of the [DHSN Dresden LaTeX template](https://github.com/ba-dresden/ba-latex-template) and keeps its names wherever possible. The prefix `ba` of the functions and environments, which goes back to the former name of the university (Berufsakademie), is replaced with `dhsn`.
The official [guide for LaTeX users](https://typst.app/docs/guides/guide-for-latex-users/) explains the general differences.

## Commands and environments

| LaTeX                                         | Typst                                                     |
| --------------------------------------------- | --------------------------------------------------------- |
| `\documentclass[...]{baarticle}`              | `#show: dhsnarticle.with(...)`                              |
| `\documentclass[...,simple]{baarticle}` and `\begin{basimple}[...]` | `#show: dhsnsimple.with(...)`          |
| options `noheader`, `linkcoloring`            | `header: false`, `linkcoloring: true`                     |
| `\mktitle{...}`, `\mkblocknotice{...}`, ...   | `#mktitle(...)`, `#mkblocknotice(...)`, ...               |
| `\mkfrontmatter{...}`                         | `#mkfrontmatter[...]`                                     |
| `\today`                                      | `today()`                                                 |
| `\newcommand{\basimpleabstract}{...}`         | `abstract: [...]`, `abstractintoc: true`                  |
| `\newacronym{id}{short}{long}`                | `acronyms: (short: "long")` or `#newacronym("id", "short", "long")` |
| `\newglossaryentry{id}{...}`                  | `glossary: (id: (name: ..., description: ...))` or `#newglossaryentry(...)` |
| `\gls{id}`                                    | `#gls("id")`                                              |
| `\begin{bafigure}[source=S,label=L]{caption}` | `#dhsnfigure(source: [S], label: "L")[caption][...]`        |
| `\begin{batable}{caption}`, `\begin{bacode}{caption}` | `#dhsntable[caption][...]`, `#dhsncode[caption][...]` |
| `\begin{baappx}`, `\addtoappx{caption}`, `\theappx` | `#dhsnappx[...]`, `#addtoappx[caption]`, `#theappx()` |
| `\bacite[29]{key}`                            | `#dhsncite(<key>)[29]` or `@key[29]`                        |
| `\vglcite[17-21]{key}`                        | `#vglcite(<key>)[17-21]`                                  |
| `\captioncite{key}`                           | `#captioncite(<key>)`                                     |
| `\addbibresource` and `\printbibliography`    | `bibliography: bibliography("document.bib")` or `#bibliography("document.bib")` |
| `\enquote{text}`                              | `"text"`                                                  |
| `\section{title}`, `\label{id}`, `\ref{id}`   | `= title`, `<id>`, `@id`                                  |
| `\clearpage`                                  | `#pagebreak()`                                            |
| `\include{chapter1}`                          | `#include "chapter1.typ"`                                 |
| `\lstset{style=github-dark}`                  | `codetheme: "github-dark"`                                |

## Differences

- Images, the assignment and the bibliography are passed as `image("path")` and `bibliography("path")` instead of their path, because Typst resolves paths relative to the file they are written in.
- The `location` of the `basimple` environment is called `companylocation`, because `location` already describes the location of the university.
- The `type` of the paper is required.
- Typst ignores the `subtitle` attribute of bibliography entries, so the subtitle has to be appended to the `title`.
- The names of the people publishing a `@collection` belong into the `editor` attribute instead of `publisher`.
- A numeric `edition` is printed as "2. Auflage".
- "ebenda" also replaces the first citation on a page and a citation following a `captioncite` of the same source. Check these cases manually.
- A reference to a figure renders to "Abbildung 1" instead of "1". Use `#ref(<label>, supplement: none)` to get the number only.
- Abbreviations, the glossary and code highlighting are part of the template. The packages glossaries, listings and biblatex have no counterpart to install.
- There are no auxiliary files. Problems are never solved by deleting generated files.
