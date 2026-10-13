---
title: Typst Web App
---

# Typst Web App

Die [Typst Web App](https://typst.app) ist ein Online-Editor mit Live-Vorschau, vergleichbar mit Overleaf. Es muss nichts installiert werden.

::: warning
Die Dateien liegen auf Servern eines Drittanbieters. Vorsicht bei vertraulichen Themen, besonders wenn deine Arbeit einen Sperrvermerk hat.
:::

## Projekt einrichten

1. Lege ein Konto und ein leeres Projekt an.
2. Lade die ZIP-Datei des neuesten [Release](https://github.com/xNycrofox/dhsn-typst-template/releases) des Templates herunter und entpacke sie.
3. Lade `lib.typ`, `dhsn.csl`, `dhsn-intext.csl` und das Verzeichnis `themes` in das Projekt hoch und behalte dabei die Verzeichnisstruktur bei.
4. Lade das Logo `template/images/logo.png` als `images/logo.png` hoch.
5. Lade ein Bild deiner Unterschrift als `images/signature.png` hoch.
6. Füge Folgendes in die Hauptdatei ein und passe es an.

```typst
#import "lib.typ": *

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

Die Vorschau rechts zeigt die Arbeit. Das PDF lässt sich über den Button oben rechts herunterladen.

::: info
Lokale Pakete wie `@local/dhsnarticle:0.1.0` gibt es in der Web App nicht. Deshalb wird das Template dort mit `#import "lib.typ": *` importiert.
:::
