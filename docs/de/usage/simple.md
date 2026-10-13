---
title: Einfacher Modus
---

# Einfacher Modus

Das Template hat einen „einfachen Modus“, den die Funktion `dhsnsimple` bereitstellt. Sie konfiguriert alles, sodass man sich um nichts kümmern muss.
Aktiviert wird der einfache Modus mit einer show-Regel am Anfang des Dokuments.

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
  assignment: image("somefile.pdf"),
)

= Caption
Here is the content of paper.
```

::: info
Das Template hängt von keinen anderen Paketen ab. Abkürzungen, Glossar, Zitate und Syntaxhervorhebung sind Teil des Templates.
:::

Zuerst die allgemeinen Optionen:

- `first` ist dein Vorname
- `last` ist dein Nachname
- `company` ist das Unternehmen, bei dem du arbeitest
- `location` ist der Ort der Hochschule (nicht zu verwechseln mit `companylocation`)
- `linkcoloring` färbt Links, wenn es auf `true` gesetzt ist
- `header` entfernt den Titel aus der Kopfzeile, wenn es auf `false` gesetzt ist
- `headertitle` ersetzt den Text der Kopfzeile durch den angegebenen Wert
- `codetheme` wählt das Farbschema von Quelltextblöcken, siehe [Umgebungen](./environments)

Und die übrigen Optionen der Funktion `dhsnsimple`:

- `img` ist das Logo der Hochschule, z. B. `image("images/logo.png")`
- `course` ist dein Studiengang
- `title` ist der Titel der Arbeit
- `number` ist deine Matrikelnummer
- `corrector` ist ein Array oder eine kommagetrennte Liste der Gutachter
- `themedate` ist der Tag der Themenübergabe. Datumsangaben können als Text oder als `datetime` angegeben werden, z. B. `datetime(year: 2026, month: 3, day: 1)`. `today()` ist das aktuelle Datum.
- `returndate` ist der Tag der Einreichung
- `signature` ist ein Bild deiner Unterschrift, z. B. `image("images/signature.png")`
- `companylocation` ist der Ort deines Unternehmens
- `type` legt die Art der Arbeit fest und beeinflusst die Titelseite. Vordefiniert sind `"thesis"`, `"master-thesis"`, `"study"` und `"report"`. Jeder andere Wert wird selbst als Bezeichnung auf der Titelseite ausgegeben. Der Parameter `type` ist Pflicht.
- `degreetype` legt den Abschluss fest, z. B. `"Arts"`, `"Engineering"` oder `"Science"`. Der Parameter ist optional und wird nur verwendet, wenn `type` auf `"thesis"` oder `"master-thesis"` steht. Der Standardwert ist `"Science"`.
- `assignment` ist eine PDF-Datei mit der Aufgabenstellung der Arbeit, z. B. `image("somefile.pdf")`. Die erste Seite der Datei wird an der passenden Stelle eingefügt. Eine andere Seite wählt `image("somefile.pdf", page: 2)`. Der Parameter ist optional.
- `blocknotice` legt fest, ob ein Sperrvermerk enthalten ist. Standardmäßig ist er enthalten, `false` lässt ihn weg.
- `ainotice` legt fest, ob ein Hinweis zur Nutzung generativer künstlicher Intelligenz erzeugt wird. Standardmäßig gibt es keinen, `true` fügt ihn hinzu.
- `aimodel` ist ein Array oder eine kommagetrennte Liste der verwendeten KI-Modelle. Der Parameter wird nur berücksichtigt, wenn `ainotice` auf `true` steht.
- `gendernotice` legt fest, ob ein Hinweis zur sprachlichen Gestaltung enthalten ist. Standardmäßig gibt es keinen.
- `abstract` ist der Inhalt des Abstracts. Der Parameter ist optional.
- `abstractintoc` nimmt das Abstract ins Inhaltsverzeichnis auf, wenn es auf `true` gesetzt ist
- `acronyms` definiert die Abkürzungen, siehe unten
- `glossary` definiert die Einträge des Glossars, siehe unten
- `bibliography` ist das Literaturverzeichnis, z. B. `bibliography("document.bib")`, siehe unten

Ein Abstract fügt man so hinzu:

```typst
#show: dhsnsimple.with(
  ...,
  abstract: [
    content of the abstract
  ],
  // if you want to add the abstract to the table of contents
  abstractintoc: true,
)
```

Das Beispieldokument lässt sich z. B. mit `typst compile file.typ` kompilieren.

## Grundfunktionen

Abschnitte erzeugt man mit `= Titel`, `== Titel` und `=== Titel`.
Die Überschriften landen automatisch im Inhaltsverzeichnis.
Soll das nicht passieren, verwende die Funktion heading, z. B. `#heading(numbering: none, outlined: false)[Titel ohne Eintrag im Inhaltsverzeichnis]`.
Fußnoten erzeugt wie üblich `#footnote[Inhalt]`.
Abkürzungen verwaltet das Template.
Definiert werden sie über den Parameter `acronyms`, der die Kurzform auf die Langform abbildet, verwendet mit `#gls("bezeichner")`.
Beim ersten Vorkommen wird die Abkürzung ausgeschrieben. Das Abkürzungsverzeichnis ist sortiert und enthält nur Abkürzungen, die verwendet werden.

```typst
#show: dhsnsimple.with(
  ...,
  acronyms: (
    HTTP: "Hypertext Transfer Protocol",
    // in case the identifier differs from the short form
    uc: (short: "UC", long: "Underpinning contract"),
  ),
)

= Caption
#gls("HTTP") is a protocol on the OSI-Layer 7.#footnote[Also note that...]
```

Über den Parameter `glossary` lassen sich außerdem Glossareinträge mit einer kurzen Beschreibung eines Begriffs definieren, auf die man ebenfalls mit `#gls("bezeichner")` verweist.

```typst
#show: dhsnsimple.with(
  ...,
  glossary: (
    cloud: (
      name: "Cloud Computing",
      description: [Cloud computing is the on-demand availability of computer system resources, especially data storage and computing power, without direct active management by the user.],
    ),
  ),
)

= Caption
#gls("cloud") is a term for ...
```

Auf Abschnitte verweist man mit `<bezeichner>`, das einen (Unter-)Abschnitt markiert, und `@bezeichner`, das die Abschnittsnummer einfügt.
Diese Verweise sind übrigens auch anklickbare Links.

```typst
= Caption 1 <important>
Something important.

= Caption 2
// Would render to "As seen in Abschnitt 1."
As seen in @important.
// Would render to "As seen in section 1."
As seen in section #ref(<important>, supplement: none).
```

Bilder bindet man mit `image` ein, am besten in einer `dhsnfigure`.
Die Nummer einer Abbildung erhält man über einen Verweis auf das Label, das der Funktion übergeben wurde.
Ohne Label dient die Beschriftung als Label. Enthält sie Leerzeichen, ist `#ref(label("die Beschriftung"))` nötig.
`image` hat einige optionale Argumente, z. B. zum Skalieren.
Siehe [hier](https://typst.app/docs/reference/visualize/image/).
Auch Tabellen gehören in eine `dhsntable`.

```typst
#dhsnfigure(label: "myfigure")[caption][
  #image("path/to/an/image.png")
]
As seen in @myfigure ...
#dhsntable[caption][
  // The page width is 16cm
  #table(
    columns: (6cm, 8cm),
    [A], [B],
    [C], [D],
  )
]
```

Einen Anhang erzeugt die Funktion `dhsnappx`, die auch eine Übersicht aller Anhänge anlegt.
Die meisten Funktionen des Templates lassen sich anpassen, wie im Abschnitt [Umgebungen](./environments) beschrieben.

```typst
// lots of content
#dhsnappx[
  #dhsnfigure[caption][
    #image("path/to/an/image.png")
  ]
]
```

Größere Dokumente teilt man am besten in mehrere Dateien auf.
Jedes Kapitel kann in einer eigenen `.typ`-Datei stehen und wird in der Hauptdatei mit `#include "pfad/zur/datei.typ"` eingebunden.
Bei folgender Dateistruktur:

```text
somedirectory
|-chapter1.typ
|-chapter2.typ
|-chapter3.typ
|-document.typ
```

funktioniert das so:

```typst
#import "@local/dhsnarticle:0.1.0": *

#show: dhsnsimple.with(...)

#include "chapter1.typ"
#include "chapter2.typ"
#include "chapter3.typ"
```

::: info
Jede Kapiteldatei, die Funktionen des Templates wie `dhsnfigure` oder `vglcite` verwendet, muss das Template selbst importieren.
:::

## Zitate und Literaturverzeichnis

Quellen werden mit `#vglcite(<citekey>)[Seiten]` und `#dhsncite(<citekey>)[Seiten]` zitiert, die Literaturdatei wird mit `bibliography: bibliography("document.bib")` übergeben.
Alles Weitere steht im Abschnitt [Zitate](./citations).

```typst
#show: dhsnsimple.with(
  ...,
  bibliography: bibliography("document.bib"),
)

= Caption
indirect citation.#vglcite(<cloudcomp>)[17-21]
"direct citation"#dhsncite(<cloudcomp>)[29]
```
