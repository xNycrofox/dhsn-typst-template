---
title: Report
---

# Report and student research project

Smaller papers like a "Belegarbeit" or "Studienarbeit" usually need neither a block notice nor an assignment.

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

## Custom type

Any other value of `type` is printed as it is, e.g. for a "Praxisbericht".

```typst
#show: dhsnsimple.with(
  ...,
  type: "Praxisbericht im 3. Semester",
)
```

## Without the parts around the content

The [normal mode](../usage/normal) allows to pick the parts yourself, e.g. a paper consisting of title page, table of contents and content only.

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
