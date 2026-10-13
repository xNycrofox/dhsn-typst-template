---
layout: home
title: DHSN Typst Template
hero:
  name: DHSN Typst Template
  text: Belege und Abschlussarbeiten nach dem Leitfaden der DHSN Dresden
  tagline: Titelseite, Vermerke, Verzeichnisse, Zitate mit „ebenda“ und Literaturverzeichnis aus einer einzigen Funktion. In Millisekunden kompiliert.
  image:
    src: /examples/title.png
    alt: Vom Template erzeugte Titelseite
  actions:
    - theme: brand
      text: Schnellstart
      link: /de/quickstart
    - theme: alt
      text: Typst-Grundlagen
      link: /de/usage/basics
    - theme: alt
      text: Beispiele
      link: /de/examples/
    - theme: alt
      text: GitHub
      link: https://github.com/xNycrofox/dhsn-typst-template
features:
  - title: Alles rund um den Inhalt
    details: Titelseite, Sperrvermerk, Hinweise zu generativer KI und zur sprachlichen Gestaltung, Abstract, eidesstattliche Erklärung und die Aufgabenstellung der Arbeit.
    link: /de/usage/simple
  - title: Verzeichnisse ohne Aufwand
    details: Inhalts-, Abbildungs-, Tabellen-, Quelltext- und Abkürzungsverzeichnis sowie ein Glossar, die nur entstehen, wenn sie Einträge haben.
    link: /de/usage/environments
  - title: Richtig zitieren
    details: Fußnoten mit „Vgl.“ und „ebenda“ und ein passendes Literaturverzeichnis, erzeugt aus einer .bib-Datei.
    link: /de/usage/citations
  - title: Schnipsel zum Kopieren
    details: Abbildungen nebeneinander, Tabellen, Quelltext aus Dateien, Formeln, Seiten im Querformat und mehr im Kochbuch.
    link: /de/examples/cookbook
  - title: Keine Abhängigkeiten
    details: Ein einziger Lauf eines einzigen Programms erzeugt das PDF. Funktioniert offline, in VS Code und in der Typst Web App.
    link: /de/setup/typst
  - title: Umstieg von LaTeX
    details: Das Gegenstück zum LaTeX-Template der DHSN Dresden, mit einer Tabelle, die jeden Befehl übersetzt.
    link: /de/migration
---

## Über das Template

Ein Template, das dem
[Leitfaden der DHSN Dresden](https://dresden.ba-sn.de/fileadmin/M3__BA_Dresden/downloads/zentrale-dokumente/Leitfaden_wissentschaftliche_Arbeiten.pdf)
so genau wie möglich folgt.
Es ist das Typst-Gegenstück zum [LaTeX-Template der DHSN Dresden](https://github.com/ba-dresden/ba-latex-template), mit dem bereits Belege und Bachelorarbeiten bestanden wurden, und beruht auf der Arbeit von dessen Mitwirkenden.
Wenn dir das Template geholfen hat, freuen wir uns über einen Stern auf
[GitHub](https://github.com/xNycrofox/dhsn-typst-template).

::: warning
Das Template kann Fehler enthalten, es gibt keine Gewähr. Für die Korrektheit deiner Arbeit bist du selbst verantwortlich.
:::

So einfach kann es sein:
Der folgende Code erzeugt ein Dokument mit Titelseite, Sperrvermerk, Inhalts-, Abbildungs-, Abkürzungs- und Tabellenverzeichnis,
Literaturverzeichnis und eidesstattlicher Erklärung, mit korrekten Abständen und Seitenzahlen.
Bei Bedarf lässt sich das Template trotzdem weitgehend anpassen.
Das Ergebnis sieht so aus ([PDF](https://xnycrofox.github.io/dhsn-typst-template/examples/simple.pdf)):

[![Seiten des Beispieldokuments](/examples/simple.png)](https://xnycrofox.github.io/dhsn-typst-template/examples/simple.pdf)

Neugierig? Weiter geht es mit dem [Schnellstart](quickstart.md).
Neu bei Typst? Die [Typst-Grundlagen](./usage/basics) erklären alles, was man zum Schreiben einer Arbeit braucht.
Bisher das LaTeX-Template genutzt? Dann hilft der [Leitfaden zum Umstieg](migration.md).

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
