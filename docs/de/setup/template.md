---
title: Template
---

# Template einrichten

## Lokales Paket

Das ist der empfohlene Weg, das Template zu nutzen.
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

Jetzt lässt sich das Template in jedem Dokument mit `#import "@local/dhsnarticle:0.1.0": *` importieren.
Ein Verzeichnis für deine Arbeit legt `typst init @local/dhsnarticle:0.1.0 meinverzeichnis` an.
Die Verzeichnisstruktur sieht dann so aus:

```text
somedirectory
|-document.bib
|-document.typ
|-images|-logo.png
|-images|-signature.png
```

Fertig! (Die benötigten Bilder musst du trotzdem noch besorgen, siehe unten.)

## Download

Alternativ kannst du das Template neben deine Arbeit kopieren.
Lege ein Verzeichnis für deine Arbeit an und kopiere die Dateien `lib.typ`, `dhsn.csl`, `dhsn-intext.csl` und das Verzeichnis `themes` hinein.
Lege eine Datei mit der Endung `.typ` an, z. B. `document.typ`, und importiere das Template mit `#import "lib.typ": *`.
Die Verzeichnisstruktur sieht dann so aus:

```text
somedirectory
|-dhsn-intext.csl
|-dhsn.csl
|-document.typ
|-lib.typ
|-themes|-github-dark.tmTheme
|-themes|-github-light.tmTheme
```

## GitHub-Template

::: warning
Stelle sicher, dass du GitHub verwenden darfst.
:::

Öffne das [Repository](https://github.com/xNycrofox/dhsn-typst-template) des Templates und klicke auf den grünen Button „Use this template“.
Folge den Anweisungen.
Klone anschließend dein Repository und lege eine Datei mit der Endung `.typ` an, z. B. `document.typ`.
Die Verzeichnisstruktur ähnelt der im Abschnitt Download.

## Git-Submodul

Lies dich in [Submodule](https://git-scm.com/book/de/v2/Git-Tools-Submodule) ein.
Lege ein leeres Repository an und füge [dieses](https://github.com/xNycrofox/dhsn-typst-template) als Submodul hinzu, z. B. im Verzeichnis `template`.
Lege im Hauptrepository eine `document.typ` an und importiere das Template mit `#import "template/lib.typ": *`.
So nutzt du immer die neueste Version des Templates, indem du im Verzeichnis des Submoduls `git pull` ausführst.
Über den Button „Watch“ wirst du benachrichtigt, wenn sich das Repository des Templates ändert.

## Typst Web App

Lade die im Abschnitt Download genannten Dateien in dein Projekt in der [Typst Web App](https://typst.app) hoch und importiere das Template mit `#import "lib.typ": *`.

## Template aktualisieren

Führe `git pull` im Verzeichnis des Templates aus, um den neuesten Stand zu erhalten.
Kompiliere deine Arbeit danach und prüfe das Ergebnis, denn die Formatierung kann sich geändert haben.

Jede Version des Templates wird außerdem auf der Seite [Releases](https://github.com/xNycrofox/dhsn-typst-template/releases) veröffentlicht, zusammen mit den kompilierten Beispielen.
Eine neue Version hat eine neue Nummer, z. B. `0.2.0`, und wird neben der alten in einem nach dieser Nummer benannten Verzeichnis installiert.
Deine Arbeit verwendet weiter die im Import genannte Version, bis du `#import "@local/dhsnarticle:0.1.0": *` änderst. Ein Update verändert eine Arbeit also nie versehentlich.

::: tip
Mit `git clone --branch v0.1.0 ...` klonst du eine bestimmte Version, falls du git der ZIP-Datei vorziehst. Bleibe während einer Abschlussarbeit bei einer Version.
:::

# Benötigte Bilder besorgen

Du brauchst ein Bild deiner Unterschrift.
Lege es im Unterordner `images` deines Projekts als `signature.png` ab.
Das Logo der Hochschule ist Teil des Templates, siehe `template/images/logo.png`. `typst init` kopiert es in dein Projekt.

::: info
Bilder und das Literaturverzeichnis werden immer im eigenen Dokument mit `image("pfad")` bzw. `bibliography("pfad")` geladen und an das Template übergeben. Typst löst Pfade relativ zu der Datei auf, in der sie stehen, deshalb kann das Template Dateien deines Projekts nicht über ihren Pfad laden.
:::
