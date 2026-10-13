---
title: Typst-Grundlagen
---

# Typst-Grundlagen

Diese Seite erklärt die Teile von Typst, die man zum Schreiben einer Arbeit mit diesem Template braucht.
Das offizielle [Tutorial](https://typst.app/docs/tutorial/) und die [Referenz](https://typst.app/docs/reference/) behandeln alles ausführlich.

## So funktioniert Typst

Eine Arbeit wird in reinen Textdateien mit der Endung `.typ` geschrieben.
Der Typst-Compiler liest die Hauptdatei, z. B. `document.typ`, und erzeugt daraus `document.pdf`.
Inhaltsverzeichnis, alle weiteren Verzeichnisse, Fußnoten und das Literaturverzeichnis entstehen in diesem einen Lauf.
Es gibt keine Hilfsdateien, und nichts muss zweimal ausgeführt werden.

```text
somedirectory
|-document.bib      the sources you cite
|-document.typ      the main file, compiled with "typst compile document.typ"
|-chapter1.typ      optional files, joined in the main file with #include
|-images|-...       images used in the paper
```

Der Compiler liest nur Dateien innerhalb des Verzeichnisses der Hauptdatei, der sogenannten Projektwurzel.
Pfade sind immer relativ zu der Datei, in der sie stehen. Ein Pfad, der mit `/` beginnt, ist relativ zur Projektwurzel.

## Markup

Text wird so geschrieben, wie er ist. Eine Leerzeile beginnt einen neuen Absatz.
Einige Zeichen haben eine besondere Bedeutung:

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

Um die Formatierung kümmert sich das Template. Überschriften werden nummeriert und ins Inhaltsverzeichnis aufgenommen, Anführungszeichen in deutsche umgewandelt und Wörter nach deutschen Regeln getrennt.
Zeichen mit besonderer Bedeutung wie `#`, `*`, `_`, `@`, `$` und `<` schreibt man mit einem Backslash davor, z. B. `\#`.

## Funktionen

Alles, was über einfaches Markup hinausgeht, erledigen Funktionen. Im Markup wird eine Funktion mit einem `#` vor ihrem Namen aufgerufen.
Argumente stehen in runden Klammern. Benannte Argumente haben die Form `name: wert`.
Inhalt steht in eckigen Klammern und kann auch hinter die runden Klammern geschrieben werden.

```typst
#pagebreak()
#image("images/diagram.png", width: 14cm)
#footnote[The content of the footnote.]
// two content arguments, the caption and the figure itself
#dhsnfigure(source: [Company])[The caption][
  #image("images/diagram.png")
]
```

Die häufigsten Werte sind:

- Text in Anführungszeichen: `"thesis"`
- Inhalt in eckigen Klammern, der Markup enthalten darf: `[Der *Titel*]`
- Zahlen und Längen: `1234`, `14cm`, `12pt`, `50%`
- Wahrheitswerte: `true` und `false`
- Arrays: `("corrector1", "corrector2")`. Ein Array mit einem einzigen Eintrag braucht ein abschließendes Komma: `("corrector1",)`
- Dictionaries: `(HTTP: "Hypertext Transfer Protocol")`

## Das Template importieren

Zugriff auf die Funktionen des Templates erhält ein Dokument über einen Import ganz oben.
Jede Datei, die Funktionen des Templates verwendet, braucht diesen Import.

```typst
// if the template is installed as local package
#import "@local/dhsnarticle:0.1.0": *
// if the files of the template are located next to the document
#import "lib.typ": *
```

Auf das gesamte Dokument angewendet wird das Template mit einer show-Regel.
Alles hinter dieser Zeile formatiert das Template.
`.with(...)` übergibt die Optionen an das Template.

```typst
#show: dhsnsimple.with(
  first: "firstname",
  last: "lastname",
  ...
)
```

## Labels und Verweise

Ein Label wird an eine Überschrift gehängt, indem man `<name>` dahinter schreibt.
`@name` erzeugt einen Verweis darauf. Quellen des Literaturverzeichnisses werden genauso zitiert.

```typst
= Introduction <intro>
As described in @intro ...
```

## Formatierung anpassen

Die Voreinstellungen jeder Funktion lassen sich mit set-Regeln ändern. Nötig ist das selten, weil das Template den Leitfaden umsetzt.
Setze sie hinter die show-Regel des Templates.

```typst
#show: dhsnsimple.with(...)
// e.g. use thinner lines in all tables
#set table(stroke: 0.4pt)
```

## Pakete

Zusätzliche Funktionen liefern Pakete, die auf [Typst Universe](https://typst.app/universe/) gelistet sind.
Ein Paket wird beim ersten Import automatisch heruntergeladen, z. B. `#import "@preview/cetz:<version>"` mit der auf seiner Seite angegebenen Version.
Einige Vorschläge stehen im Abschnitt [Pakete](./packages).

## Kompilieren

- `typst compile document.typ` erzeugt `document.pdf`
- `typst watch document.typ` kompiliert das Dokument neu, sobald sich eine Datei ändert
- `typst fonts` listet alle Schriften auf, die Typst verwenden kann
- `typst init @local/dhsnarticle:0.1.0 meinverzeichnis` legt aus dem Template eine neue Arbeit an

Fehler werden mit Datei, Zeile und Beschreibung gemeldet. Bei einem Fehler entsteht kein PDF.
Editoren mit der Tinymist-Erweiterung und die [Typst Web App](https://typst.app) zeigen beim Tippen eine Live-Vorschau und die Fehler.
