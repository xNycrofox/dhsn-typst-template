---
title: Bachelor Thesis
sort: 1
---

# Bachelor Thesis

A thesis split into multiple files with all parts the styleguide asks for.

```text
thesis
|-thesis.typ
|-thesis.bib
|-assignment.pdf
|-chapters|-introduction.typ
|-chapters|-basics.typ
|-chapters|-conclusion.typ
|-images|-logo.png
|-images|-signature.png
```

`thesis.typ`:

```typst
#import "@local/baarticle:0.1.0": *

#show: basimple.with(
  first: "Erika",
  last: "Mustermann",
  company: "Beispiel GmbH",
  location: "Dresden",
  img: image("images/logo.png"),
  course: "Informationstechnik",
  title: "Einführung einer Container-Plattform in einem mittelständischen Unternehmen",
  // the title is too long for the header
  headertitle: "Einführung einer Container-Plattform",
  number: 1234567,
  corrector: ("Prof. Dr. Max Beispiel", "Dipl.-Inf. Eva Muster"),
  themedate: datetime(year: 2026, month: 7, day: 6),
  returndate: datetime(year: 2026, month: 9, day: 28),
  signature: image("images/signature.png"),
  companylocation: "Radebeul",
  type: "thesis",
  degreetype: "Engineering",
  assignment: image("assignment.pdf"),
  ainotice: true,
  aimodel: ("Claude", "DeepL Write"),
  gendernotice: true,
  abstract: [
    Diese Arbeit untersucht ...
  ],
  acronyms: (
    CI: "Continuous Integration",
    K8s: "Kubernetes",
  ),
  glossary: (
    container: (
      name: "Container",
      description: [Eine isolierte Laufzeitumgebung für Anwendungen.],
    ),
  ),
  bibliography: bibliography("thesis.bib"),
)

#include "chapters/introduction.typ"
#include "chapters/basics.typ"
#include "chapters/conclusion.typ"

#baappx[
  #bafigure[Architektur der Plattform][
    #image("images/logo.png", width: 10cm)
  ]
]
```

`chapters/introduction.typ`:

```typst
#import "@local/baarticle:0.1.0": *

= Einleitung <einleitung>

== Motivation
#gls("K8s") hat sich als Standard etabliert.#vglcite(<cloudcomp>)[17-21]
Ein #gls("container") ist ...

== Aufbau der Arbeit
Die Grundlagen werden in @grundlagen beschrieben.
```

`chapters/basics.typ`:

```typst
#import "@local/baarticle:0.1.0": *

= Grundlagen <grundlagen>

#bafigure(source: captioncite(<cloudcomp>)[12], label: "schichten")[Schichten einer Plattform][
  #image("../images/logo.png", width: 8cm)
]

Wie @schichten zeigt ...
```

```note
 Paths are relative to the file they are written in. That is why the chapter refers to the image with `../images/logo.png`. `/images/logo.png` works in every file, as it starts at the directory of the main file.
```

Compile the thesis with `typst compile thesis.typ`.

## Master thesis

Set `type: "master-thesis"`. The title page then reads "Masterarbeit zur Erlangung des Abschlusses Master of Engineering".

## Without block notice

Set `blocknotice: false` if the paper does not contain confidential data.
