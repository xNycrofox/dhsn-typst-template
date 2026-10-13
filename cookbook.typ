// Collection of snippets for common tasks, see the "Cookbook" page of the documentation
#import "lib.typ": *

#show: basimple.with(
  first: "Erika",
  last: "Mustermann",
  company: "Beispiel GmbH",
  location: "Dresden",
  img: image("images/logo.png"),
  course: "Informationstechnik",
  title: "Kochbuch für das DHSN Typst Template",
  headertitle: "Kochbuch",
  number: 1234567,
  corrector: ("Prof. Dr. Max Beispiel", "Dipl.-Inf. Eva Muster"),
  themedate: datetime(year: 2026, month: 7, day: 6),
  returndate: datetime(year: 2026, month: 9, day: 28),
  signature: image("images/signature.png"),
  companylocation: "Dresden",
  type: "study",
  blocknotice: false,
  acronyms: (
    API: "Application Programming Interface",
    HTTP: "Hypertext Transfer Protocol",
  ),
  bibliography: bibliography("minimal.bib"),
)

// number equations on the right side
#set math.equation(numbering: "(1)")

= Text

== Hervorhebungen und Listen
Text kann *fett* oder _kursiv_ gesetzt werden. "Anführungszeichen" werden automatisch umgewandelt.
Ein #gls("API") wird bei der ersten Verwendung ausgeschrieben, danach steht nur noch #gls("API").

- ein Punkt einer Aufzählung
- ein weiterer Punkt
  - mit einem Unterpunkt

+ erster Schritt
+ zweiter Schritt

/ Begriff: Eine Beschreibung des Begriffs.

== Zitate
Ein indirektes Zitat.#vglcite(<cloudcomp>)[17-21]
"Ein direktes Zitat."#bacite(<cloudcomp>)[29]
Die Kurzform funktioniert genauso.@rpa[115]
Zwei Quellen an einer Stelle.#vglcite(<cloudcomp>)[40]#super[,]#vglcite(<rpa>)[120]

#quote(block: true, attribution: [Rittinghouse/Ransome (2018), S. 5])[
  Ein längeres wörtliches Zitat wird als eingerückter Block gesetzt.
]

== Fußnoten und Verweise <verweise>
Eine Anmerkung steht in einer Fußnote.#footnote[Der Text der Fußnote.]
Auf @verweise, @architektur, @vergleich, @hello und @pythagoras kann verwiesen werden.
Nur die Nummer liefert #ref(<architektur>, supplement: none).

= Abbildungen

#bafigure(label: "architektur")[Eine Abbildung mit fester Breite][
  #image("images/logo.png", width: 6cm)
]

#bafigure(source: captioncite(<cloudcomp>)[12])[Zwei Bilder nebeneinander][
  #grid(
    columns: 2,
    gutter: 1cm,
    align: center + horizon,
    image("images/logo.png", width: 5cm), image("images/signature.png", width: 5cm),
    [a) Logo], [b) Unterschrift],
  )
]

= Tabellen

#batable(label: "vergleich")[Eine Tabelle mit Kopfzeile][
  #table(
    columns: (auto, 1fr, auto),
    align: (left, left, right),
    table.header([*Nr.*], [*Beschreibung*], [*Wert*]),
    [1], [Ein kurzer Text], [11,10],
    [2], [Ein längerer Text, der innerhalb der Spalte automatisch umgebrochen wird, sobald er zu lang ist], [180,10],
    table.cell(colspan: 2)[Summe], [191,20],
  )
]

#batable(source: [Beispiel GmbH])[Eine Tabelle nur mit waagerechten Linien][
  #table(
    columns: 3,
    stroke: (x, y) => (top: if y < 2 { 0.4pt }, bottom: 0.4pt),
    table.header([Jahr], [Umsatz], [Gewinn]),
    [2024], [1,2 Mio. €], [0,1 Mio. €],
    [2025], [1,5 Mio. €], [0,2 Mio. €],
  )
]

= Quelltext

Im Text wird Quelltext mit Backticks gesetzt, z. B. `print()`.

#bacode(label: "hello")[Quelltext direkt im Dokument][
  ```python
  def greet(name):
      print(f"Hello {name}!")
  ```
]

#bacode(source: [Beispiel GmbH])[Quelltext aus einer Datei][
  #raw(read("examples/hello.py"), lang: "python", block: true)
]

= Formeln

Formeln im Text wie $a^2 + b^2 = c^2$ stehen zwischen Dollarzeichen.
Mit Leerzeichen innerhalb der Dollarzeichen wird die Formel abgesetzt und nummeriert:

$ c = sqrt(a^2 + b^2) $ <pythagoras>

$ sum_(i=1)^n i = (n (n + 1)) / 2 $

= Seitenlayout

Ein Seitenumbruch wird mit `#pagebreak()` erzwungen.
Die folgende Seite steht im Querformat, z. B. für breite Tabellen.

#page(flipped: true)[
  #batable[Eine breite Tabelle im Querformat][
    #table(
      columns: (1fr,) * 8,
      ..range(1, 25).map(i => [Zelle #i])
    )
  ]
]

#baappx[
  #bafigure[Ein Bild im Anhang][
    #image("images/logo.png", width: 4cm)
  ]
  #pagebreak()
  #addtoappx[Ein Interviewleitfaden]
  Ein Eintrag im Anhangverzeichnis, der keine Abbildung ist: #theappx().
]
