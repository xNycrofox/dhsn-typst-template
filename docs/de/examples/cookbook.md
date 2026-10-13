---
title: Kochbuch
---

# Kochbuch

Schnipsel für häufige Aufgaben. Alle stammen aus [cookbook.typ](https://github.com/xNycrofox/dhsn-typst-template/blob/main/examples/cookbook.typ), das Ergebnis zeigt dieses [PDF](https://xnycrofox.github.io/dhsn-typst-template/examples/cookbook.pdf).

[![Seiten des Kochbuchs](/examples/cookbook.png)](https://xnycrofox.github.io/dhsn-typst-template/examples/cookbook.pdf)

## Text, Listen und Abkürzungen

```typst
== Hervorhebungen und Listen
Text kann *fett* oder _kursiv_ gesetzt werden. "Anführungszeichen" werden automatisch umgewandelt.
Ein #gls("API") wird bei der ersten Verwendung ausgeschrieben, danach steht nur noch #gls("API").

- ein Punkt einer Aufzählung
- ein weiterer Punkt
  - mit einem Unterpunkt

+ erster Schritt
+ zweiter Schritt

/ Begriff: Eine Beschreibung des Begriffs.
```

## Zitate

```typst
== Zitate
Ein indirektes Zitat.#vglcite(<cloudcomp>)[17-21]
"Ein direktes Zitat."#dhsncite(<cloudcomp>)[29]
Die Kurzform funktioniert genauso.@rpa[115]
Zwei Quellen an einer Stelle.#vglcite(<cloudcomp>)[40]#super[,]#vglcite(<rpa>)[120]

#quote(block: true, attribution: [Rittinghouse/Ransome (2018), S. 5])[
  Ein längeres wörtliches Zitat wird als eingerückter Block gesetzt.
]
```

## Fußnoten und Verweise

Labels hängt man an Überschriften mit `<name>`, an Abbildungen, Tabellen und Quelltexte mit dem Argument `label` und an Formeln mit `<name>` dahinter.

```typst
== Fußnoten und Verweise <verweise>
Eine Anmerkung steht in einer Fußnote.#footnote[Der Text der Fußnote.]
Auf @verweise, @architektur, @vergleich, @hello und @pythagoras kann verwiesen werden.
Nur die Nummer liefert #ref(<architektur>, supplement: none).
```

## Abbildungen

```typst
#dhsnfigure(label: "architektur")[Eine Abbildung mit fester Breite][
  #image("images/logo.png", width: 6cm)
]

#dhsnfigure(source: captioncite(<cloudcomp>)[12])[Zwei Bilder nebeneinander][
  #grid(
    columns: 2,
    gutter: 1cm,
    align: center + horizon,
    image("images/logo.png", width: 5cm), image("images/signature.png", width: 5cm),
    [a) Logo], [b) Unterschrift],
  )
]
```

## Tabellen

```typst
#dhsntable(label: "vergleich")[Eine Tabelle mit Kopfzeile][
  #table(
    columns: (auto, 1fr, auto),
    align: (left, left, right),
    table.header([*Nr.*], [*Beschreibung*], [*Wert*]),
    [1], [Ein kurzer Text], [11,10],
    [2], [Ein längerer Text, der innerhalb der Spalte automatisch umgebrochen wird, sobald er zu lang ist], [180,10],
    table.cell(colspan: 2)[Summe], [191,20],
  )
]

#dhsntable(source: [Beispiel GmbH])[Eine Tabelle nur mit waagerechten Linien][
  #table(
    columns: 3,
    stroke: (x, y) => (top: if y < 2 { 0.4pt }, bottom: 0.4pt),
    table.header([Jahr], [Umsatz], [Gewinn]),
    [2024], [1,2 Mio. €], [0,1 Mio. €],
    [2025], [1,5 Mio. €], [0,2 Mio. €],
  )
]
```

- `columns` nimmt die Anzahl der Spalten oder ihre Breiten entgegen. `auto` passt sich dem Inhalt an, `1fr` nimmt den restlichen Platz.
- `table.header` wird wiederholt, wenn die Tabelle über mehrere Seiten geht. Damit sie umbrechen darf, setzt man die Tabelle direkt ins Dokument statt in eine `dhsntable`.
- `stroke: none` entfernt alle Linien.

## Quelltext

````typst
Im Text wird Quelltext mit Backticks gesetzt, z. B. `print()`.

#dhsncode(label: "hello")[Quelltext direkt im Dokument][
  ```python
  def greet(name):
      print(f"Hello {name}!")
  ```
]

#dhsncode(source: [Beispiel GmbH])[Quelltext aus einer Datei][
  #raw(read("hello.py"), lang: "python", block: true)
]
````

`#raw(read("datei"), lang: "python", block: true)` belässt den Quelltext in seiner eigenen Datei, sodass er ausgeführt und getestet werden kann.
Ein dunkles Farbschema wählt `codetheme: "github-dark"`.

## Formeln

Mit `#set math.equation(numbering: "(1)")` hinter der show-Regel des Templates werden Formeln nummeriert.

```typst
Formeln im Text wie $a^2 + b^2 = c^2$ stehen zwischen Dollarzeichen.
Mit Leerzeichen innerhalb der Dollarzeichen wird die Formel abgesetzt und nummeriert:

$ c = sqrt(a^2 + b^2) $ <pythagoras>

$ sum_(i=1)^n i = (n (n + 1)) / 2 $
```

## Seitenumbrüche und Querformat

```typst
#pagebreak()

#page(flipped: true)[
  #dhsntable[Eine breite Tabelle im Querformat][
    #table(
      columns: (1fr,) * 8,
      ..range(1, 25).map(i => [Zelle #i])
    )
  ]
]
```

## Anhang

```typst
#dhsnappx[
  #dhsnfigure[Ein Bild im Anhang][
    #image("images/logo.png", width: 4cm)
  ]
  #pagebreak()
  #addtoappx[Ein Interviewleitfaden]
  Ein Eintrag im Anhangverzeichnis, der keine Abbildung ist: #theappx().
]
```

## Datumsangaben

```typst
// the current date, e.g. "13. Oktober 2026"
returndate: today(),
// a fixed date, printed as "28. September 2026"
returndate: datetime(year: 2026, month: 9, day: 28),
// printed as it is
returndate: "28.09.2026",
```

## Überschriften ohne Nummer oder Eintrag im Inhaltsverzeichnis

```typst
// no number, but listed in the table of contents
#heading(numbering: none)[Danksagung]
// neither number nor entry
#heading(numbering: none, outlined: false)[Danksagung]
```

## Ein langer Titel in der Kopfzeile

Die Kopfzeile zeigt den Titel der Arbeit. Lange Titel sollten auf höchstens 80 Zeichen gekürzt oder aus der Kopfzeile entfernt werden.

```typst
#show: dhsnsimple.with(
  ...,
  headertitle: "A shorter title",
  // or no header at all
  header: false,
)
```
