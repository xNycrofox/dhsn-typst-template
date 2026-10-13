---
title: Belegarbeit
---

# Belegarbeit und Studienarbeit

Kleinere Arbeiten wie eine Belegarbeit oder Studienarbeit brauchen meist weder Sperrvermerk noch Aufgabenstellung.

```typst
#import "@local/dhsnarticle:0.1.0": *

#show: dhsnsimple.with(
  first: "Erika",
  last: "Mustermann",
  company: "Beispiel GmbH",
  location: "Dresden",
  img: image("images/logo.png"),
  course: "Wirtschaftsinformatik",
  title: "Vergleich von Message Brokern",
  number: 1234567,
  corrector: "Prof. Dr. Max Beispiel",
  themedate: "06.07.2026",
  returndate: today(),
  signature: image("images/signature.png"),
  // "report" prints "Belegarbeit", "study" prints "Studienarbeit"
  type: "report",
  blocknotice: false,
  bibliography: bibliography("document.bib"),
)

= Einleitung
...
```

## Eigene Bezeichnung

Jeder andere Wert von `type` wird unverändert ausgegeben, z. B. für einen Praxisbericht.

```typst
#show: dhsnsimple.with(
  ...,
  type: "Praxisbericht im 3. Semester",
)
```

## Ohne die Teile rund um den Inhalt

Im [normalen Modus](../usage/normal) wählt man die Teile selbst, z. B. für eine Arbeit, die nur aus Titelseite, Inhaltsverzeichnis und Inhalt besteht.

```typst
#import "@local/dhsnarticle:0.1.0": *

#show: dhsnarticle.with(first: "Erika", last: "Mustermann", company: "Beispiel GmbH", location: "Dresden")

#mktitle(
  title: "Vergleich von Message Brokern",
  img: image("images/logo.png"),
  course: "Wirtschaftsinformatik",
  number: 1234567,
  corrector: "Prof. Dr. Max Beispiel",
  themedate: "06.07.2026",
  returndate: today(),
  type: "report",
)
#mkfrontmatter[]

= Einleitung
...
```
