---
title: Typst
---

# Typst einrichten

::: tip
Typst bietet einen Online-Editor, die Typst Web App. Wer sie [nutzt](./webapp), kann die gesamte lokale Einrichtung überspringen. Vorsicht bei vertraulichen Themen.
:::

## Compiler

Du brauchst den Typst-Compiler in Version 0.14 oder neuer. Er ist eine einzelne ausführbare Datei ohne weitere Abhängigkeiten.

### Windows

Führe `winget install --id Typst.Typst` aus oder lade die ausführbare Datei von der Seite [Releases](https://github.com/typst/typst/releases) herunter.

### macOS

Führe `brew install typst` aus.

### Linux

Frag deinen Paketmanager.
Die meisten Distributionen bieten ein Paket `typst`. Alternativ lade die ausführbare Datei von der Seite [Releases](https://github.com/typst/typst/releases) herunter.

## Schriften

Das Template verwendet die Schriften „New Computer Modern“ und „DejaVu Sans Mono“.
Beide sind in den Typst-Compiler eingebettet, es muss also nichts installiert werden.

## Editor

Als Nächstes brauchst du einen Editor.
Die Auswahl ist groß und beginnt beim einfachen Texteditor.
Empfohlen wird [VS Code](https://code.visualstudio.com/) mit der Erweiterung [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist), die Live-Vorschau, Vervollständigung und Formatierung mitbringt.

Die Erweiterung kompiliert das Dokument selbst. Öffne die `.typ`-Datei und klicke über der ersten Zeile auf „Preview“ oder führe den Befehl „Typst Preview: Preview Opened File“ aus. Die Vorschau folgt dem Cursor, ein Klick in die Vorschau springt zur Quelle. „Export PDF“ erzeugt das PDF.

Weitere Editoren mit Typst-Unterstützung über Tinymist sind Neovim, Helix, Zed und Sublime Text.

## Kompilieren

Um aus Typst-Code ein PDF zu erhalten, muss kompiliert werden.
Ein einziger Lauf eines einzigen Programms genügt: `typst compile document.typ`.
Mit `typst watch document.typ` wird das Dokument automatisch neu kompiliert, sobald sich eine Datei ändert.

::: info
Literaturverzeichnis, Inhaltsverzeichnis und alle weiteren Verzeichnisse entstehen in diesem einen Lauf. Es gibt keine Hilfsdateien, die aufgeräumt werden müssten.
:::

Nützliche Optionen des Compilers:

| Befehl                                               | Beschreibung                                             |
| ---------------------------------------------------- | -------------------------------------------------------- |
| `typst compile document.typ`                         | erzeugt `document.pdf`                                   |
| `typst compile document.typ arbeit.pdf`              | erzeugt `arbeit.pdf`                                     |
| `typst watch document.typ`                           | kompiliert neu, sobald sich eine Datei ändert            |
| `typst compile --pages 1-3 document.typ`             | exportiert nur einzelne Seiten                           |
| `typst compile --pdf-standard a-2b document.typ`     | erzeugt eine PDF/A-Datei                                 |
| `typst compile --root .. document.typ`               | erlaubt den Zugriff auf Dateien im übergeordneten Verzeichnis |
| `typst fonts`                                        | listet die verfügbaren Schriften auf                     |
| `typst update`                                       | aktualisiert den Compiler, falls er von Hand heruntergeladen wurde |
