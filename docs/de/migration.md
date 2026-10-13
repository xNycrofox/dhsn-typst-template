---
title: Umstieg von LaTeX
---

# Umstieg von LaTeX

Dieses Template ist das Gegenstück zum [LaTeX-Template der DHSN Dresden](https://github.com/ba-dresden/ba-latex-template) und behält dessen Namen, wo immer es geht. Das Präfix `ba` der Funktionen und Umgebungen, das auf den früheren Namen der Hochschule (Berufsakademie) zurückgeht, ist durch `dhsn` ersetzt.
Die allgemeinen Unterschiede erklärt der offizielle [Leitfaden für LaTeX-Nutzer](https://typst.app/docs/guides/guide-for-latex-users/).

## Befehle und Umgebungen

| LaTeX                                         | Typst                                                     |
| --------------------------------------------- | --------------------------------------------------------- |
| `\documentclass[...]{baarticle}`              | `#show: dhsnarticle.with(...)`                            |
| `\documentclass[...,simple]{baarticle}` und `\begin{basimple}[...]` | `#show: dhsnsimple.with(...)`      |
| Optionen `noheader`, `linkcoloring`           | `header: false`, `linkcoloring: true`                     |
| `\mktitle{...}`, `\mkblocknotice{...}`, ...   | `#mktitle(...)`, `#mkblocknotice(...)`, ...               |
| `\mkfrontmatter{...}`                         | `#mkfrontmatter[...]`                                     |
| `\today`                                      | `today()`                                                 |
| `\newcommand{\basimpleabstract}{...}`         | `abstract: [...]`, `abstractintoc: true`                  |
| `\newacronym{id}{short}{long}`                | `acronyms: (short: "long")` oder `#newacronym("id", "short", "long")` |
| `\newglossaryentry{id}{...}`                  | `glossary: (id: (name: ..., description: ...))` oder `#newglossaryentry(...)` |
| `\gls{id}`                                    | `#gls("id")`                                              |
| `\begin{bafigure}[source=S,label=L]{caption}` | `#dhsnfigure(source: [S], label: "L")[caption][...]`      |
| `\begin{batable}{caption}`, `\begin{bacode}{caption}` | `#dhsntable[caption][...]`, `#dhsncode[caption][...]` |
| `\begin{baappx}`, `\addtoappx{caption}`, `\theappx` | `#dhsnappx[...]`, `#addtoappx[caption]`, `#theappx()` |
| `\bacite[29]{key}`                            | `#dhsncite(<key>)[29]` oder `@key[29]`                    |
| `\vglcite[17-21]{key}`                        | `#vglcite(<key>)[17-21]`                                  |
| `\captioncite{key}`                           | `#captioncite(<key>)`                                     |
| `\addbibresource` und `\printbibliography`    | `bibliography: bibliography("document.bib")` oder `#bibliography("document.bib")` |
| `\enquote{text}`                              | `"text"`                                                  |
| `\section{title}`, `\label{id}`, `\ref{id}`   | `= title`, `<id>`, `@id`                                  |
| `\clearpage`                                  | `#pagebreak()`                                            |
| `\include{chapter1}`                          | `#include "chapter1.typ"`                                 |
| `\lstset{style=github-dark}`                  | `codetheme: "github-dark"`                                |

## Was gleich bleibt

Das Aussehen folgt der LaTeX-Klasse `baarticle`. Zwei Dinge, die oft für Abweichungen gehalten werden, verhalten sich dort genauso:

- Der Titel der Arbeit steht in der Kopfzeile jeder Seite, mit einer Linie darunter. In LaTeX schaltet das die Option `noheader` ab, hier `header: false`.
- `dhsnfigure` zeichnet einen Rahmen um seinen Inhalt, auch im Anhang, so wie `bafigure` seinen Inhalt in eine `\fbox` setzt. Quelltext ist ebenfalls gerahmt, wie mit `frame=single` des Pakets listings. Ohne Rahmen kommt der Inhalt aus, wenn er nicht in `dhsnfigure` steht, etwa in `dhsntable` oder direkt im Dokument.

## Unterschiede

- Bilder, die Aufgabenstellung und das Literaturverzeichnis werden als `image("pfad")` bzw. `bibliography("pfad")` übergeben statt als Pfad, weil Typst Pfade relativ zu der Datei auflöst, in der sie stehen.
- Das `location` der Umgebung `basimple` heißt `companylocation`, weil `location` bereits den Ort der Hochschule beschreibt.
- Der `type` der Arbeit ist Pflicht.
- Typst ignoriert das Attribut `subtitle` von Literatureinträgen, der Untertitel muss an den `title` angehängt werden.
- Die Namen der Herausgeber einer `@collection` gehören in das Attribut `editor` statt `publisher`.
- Eine numerische `edition` wird als „2. Auflage“ ausgegeben.
- „ebenda“ ersetzt auch das erste Zitat auf einer Seite und ein Zitat, das auf ein `captioncite` derselben Quelle folgt. Diese Fälle bitte von Hand prüfen.
- Ein Verweis auf eine Abbildung ergibt „Abbildung 1“ statt „1“. Nur die Nummer liefert `#ref(<label>, supplement: none)`.
- Abkürzungen, Glossar und Syntaxhervorhebung sind Teil des Templates. Für die Pakete glossaries, listings und biblatex muss nichts installiert werden.
- Es gibt keine Hilfsdateien. Probleme löst man nie durch das Löschen erzeugter Dateien.
