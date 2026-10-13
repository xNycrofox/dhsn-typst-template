---
title: Umgebungen
---

# Umgebungen

Das Template stellt zwei Funktionen für Abbildungen und Tabellen bereit.
Beide brechen nicht um, wenn der Inhalt länger als eine Seite ist, stattdessen rutscht der Inhalt auf die nächste Seite.
Großen Inhalt teilt man deshalb besser auf mehrere `dhsnfigure` oder `dhsntable` auf.
Für Quelltext in der Arbeit gibt es zusätzlich die Funktion `dhsncode`.

## dhsnfigure

Die Funktion `dhsnfigure` zeichnet einen Rahmen um ihren Inhalt, versieht ihn mit einem Label und trägt ihn ins Abbildungsverzeichnis ein.
Unter der Abbildung steht die angegebene Beschriftung mit Quellenangabe.

```typst
#dhsnfigure(
  source: [SOURCE],
  placement: auto,
  label: "LABEL",
)[CAPTION][
  // The content e.g. #image("...")
  // Large images should be nicely sized by setting their width to 14cm, e.g. #image("...", width: 14cm)
]
```

Die optionalen Argumente kurz erklärt:

- `source` ist die Quelle der Abbildung, ohne Angabe „eigene Darstellung“. Für korrektes Zitieren an dieser Stelle dient `captioncite`, z. B. `source: captioncite(<citekey>)[17]`.
- `placement` beschreibt die Platzierung der Abbildung. Der Standard `none` setzt sie genau dorthin, wo sie im Code steht. Weitere Werte sind `auto`, `top` und `bottom`.
- `label` ist das Label, das man in `@label` verwenden kann, ohne Angabe ist es die Beschriftung.

::: info
Ein Verweis wie `@label` ergibt „Abbildung 1“. Nur die Nummer liefert `#ref(<label>, supplement: none)`. Ist das Label die Beschriftung und enthält Leerzeichen, muss der Verweis als `#ref(label("die Beschriftung"))` geschrieben werden.
:::

::: info
Der Rahmen entspricht der LaTeX-Vorlage und wird auch im Anhang gezeichnet. Inhalt ohne Rahmen gehört in `dhsntable` oder direkt ins Dokument.
:::

## dhsntable

Die Funktion `dhsntable` zentriert ihren Inhalt und trägt ihn ins Tabellenverzeichnis ein.
Unter der Tabelle steht die angegebene Beschriftung mit Quellenangabe.

```typst
#dhsntable(
  source: [SOURCE],
  placement: auto,
  label: "LABEL",
)[CAPTION][
  // The content e.g. a #table(...)
]
```

Die optionalen Argumente haben dieselbe Bedeutung wie bei `dhsnfigure`.

- `source` ist die Quelle der Tabelle, ohne Angabe „eigene Darstellung“. Für korrektes Zitieren an dieser Stelle dient `captioncite`.
- `placement` beschreibt die Platzierung der Tabelle. Der Standard `none` setzt sie genau dorthin, wo sie im Code steht.
- `label` ist das Label, das man in `@label` verwenden kann, ohne Angabe ist es die Beschriftung.

Fußnoten in Tabellen funktionieren wie überall mit `#footnote[...]`.

## dhsncode

Die Funktion `dhsncode` versieht ihren Inhalt mit einer Beschriftung und trägt ihn ins Quelltextverzeichnis ein.
Die Beschriftung mit Quellenangabe steht unter dem Quelltext. Anders als Abbildungen und Tabellen darf Quelltext über mehrere Seiten gehen.

````typst
#dhsncode(
  source: [SOURCE],
  label: "LABEL",
)[CAPTION][
  ```python
  print("Hello World!")
  ```
]
````

Die optionalen Argumente haben dieselbe Bedeutung wie bei `dhsnfigure` und `dhsntable`.

- `source` ist die Quelle des Quelltexts, ohne Angabe „eigene Darstellung“. Für korrektes Zitieren an dieser Stelle dient `captioncite`.
- `placement` gibt es **nicht**.
- `label` ist das Label, das man in `@label` verwenden kann, ohne Angabe ist es die Beschriftung.

Das Template bietet zwei Farbschemata für die Syntaxhervorhebung: `github-light` und `github-dark`, angelehnt an die Darstellung auf [GitHub](https://github.com). Die DHSN macht leider keine Vorgaben zur Formatierung von Quelltext. Standard ist `github-light`. Ändern lässt sich das mit der Option `codetheme: "github-dark"` von `dhsnsimple` und `dhsnarticle`. `codetheme: none` schaltet die Gestaltung des Templates ab, sodass man Quelltextblöcke mit eigenen show-Regeln gestalten kann. Mehr zu Quelltext in Typst steht in der Referenz zu [raw](https://typst.app/docs/reference/text/raw/).

## dhsnappx

Die Funktion `dhsnappx` erzeugt den Anhang samt Anhangverzeichnis und die nötigen Einträge im Inhaltsverzeichnis.
Sie ändert das Verhalten von `dhsnfigure`, `dhsntable` und `dhsncode` so, dass diese keine Einträge im Abbildungs-, Tabellen- bzw. Quelltextverzeichnis erzeugen,
sondern im Anhangverzeichnis.

```typst
#dhsnappx[
  #dhsnfigure[CAPTION][
    // A figure in the appendix
  ]
  #pagebreak()
  #dhsntable[CAPTION][
    // A table in the appendix
  ]
]
```

Im gesamten Dokument liefert `#theappx()` die Nummer des letzten Anhangs.
Einen Eintrag im Anhangverzeichnis legt man von Hand mit `#addtoappx[Beschriftung]` an.
