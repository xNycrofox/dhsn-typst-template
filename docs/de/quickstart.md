---
title: Schnellstart
---

# Schnellstart

Der Schnellstart zeigt einen einfachen Weg, mit diesem Template und Typst loszulegen.
Für die meisten Schritte gibt es Alternativen, die in den anderen Artikeln dieser Dokumentation beschrieben sind.

## Typst installieren

Installiere den [Typst-Compiler](https://github.com/typst/typst#installation), z. B. mit `winget install --id Typst.Typst` unter Windows oder `brew install typst` unter macOS.
Mehr ist nicht nötig. Typst ist ein einzelnes Programm, das die vom Template benötigten Schriften bereits mitbringt.

## Template herunterladen

Typst sucht lokale Pakete in einem bestimmten Verzeichnis deines Benutzerkontos.
Klone das Template unter dem Namen `dhsnarticle/0.1.0` in dieses Verzeichnis.

Windows (PowerShell):

```sh
git clone https://github.com/xNycrofox/dhsn-typst-template "$env:APPDATA\typst\packages\local\dhsnarticle\0.1.0"
```

macOS:

```sh
git clone https://github.com/xNycrofox/dhsn-typst-template "$HOME/Library/Application Support/typst/packages/local/dhsnarticle/0.1.0"
```

Linux:

```sh
git clone https://github.com/xNycrofox/dhsn-typst-template "$HOME/.local/share/typst/packages/local/dhsnarticle/0.1.0"
```

::: info
Ohne git: Lade `dhsnarticle-0.1.0.zip` von der Seite [Releases](https://github.com/xNycrofox/dhsn-typst-template/releases) herunter und entpacke es in das Verzeichnis `local` der obigen Pfade, sodass `local/dhsnarticle/0.1.0/typst.toml` existiert.
:::

Lege anschließend mit `typst init @local/dhsnarticle:0.1.0 meinverzeichnis` ein Verzeichnis an, das alle Dateien deiner Arbeit enthält.
Die Verzeichnisstruktur sieht dann so aus:

```text
somedirectory
|-document.bib
|-document.typ
|-images|-logo.png
|-images|-signature.png
```

## Benötigte Bilder besorgen

Du brauchst ein Bild deiner Unterschrift.
Lege es im Unterordner `images` unter dem Namen `signature.png` ab.

::: info
Hat das Bild deiner Unterschrift eine andere Dateiendung als png, verwende diese.
:::

## Die erste Arbeit bauen

Öffne die Datei `document.typ` in einem Editor deiner Wahl. Sie enthält etwas Ähnliches wie den folgenden Code.

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

Jetzt muss das Dokument nur noch kompiliert werden.
Öffne eine Kommandozeile im Arbeitsverzeichnis und führe `typst compile document.typ` aus.
Danach existiert `document.pdf`. Weitere Dateien entstehen nicht.
Das PDF kannst du in einem beliebigen Betrachter öffnen.
Die erste Seite des Ergebnisses sieht so aus:

![Titelseite](/examples/title.png)

Als Nächstes lohnt sich ein Blick in die [Typst-Grundlagen](./usage/basics) und den [einfachen Modus](./usage/simple).
Vollständige Dokumente zum Abschauen zeigen die [Beispiele](./examples/).

::: tip
`typst watch document.typ` kompiliert das Dokument neu, sobald sich eine Datei ändert. Manche PDF-Betrachter, etwa Adobe Reader, sperren die Datei. Schließe sie vor dem Kompilieren, sonst schlägt es fehl.
:::
