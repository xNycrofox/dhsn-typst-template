# Beispiele

Vollständige Dokumente, die als Ausgangspunkt dienen können. Alle sind Teil des [Repositorys](https://github.com/xNycrofox/dhsn-typst-template) und mit der aktuellen Version des Templates kompiliert.

| Dokument | Ergebnis | Beschreibung |
| -------- | -------- | ------------ |
| [simple.typ](https://github.com/xNycrofox/dhsn-typst-template/blob/main/examples/simple.typ) | [PDF](https://xnycrofox.github.io/dhsn-typst-template/examples/simple.pdf) | einfacher Modus mit Abkürzungen, Glossar, Abstract, Tabellen, Quelltext und Anhang |
| [minimal.typ](https://github.com/xNycrofox/dhsn-typst-template/blob/main/examples/minimal.typ) | [PDF](https://xnycrofox.github.io/dhsn-typst-template/examples/minimal.pdf) | normaler Modus mit Zitaten und Literaturverzeichnis |
| [cookbook.typ](https://github.com/xNycrofox/dhsn-typst-template/blob/main/examples/cookbook.typ) | [PDF](https://xnycrofox.github.io/dhsn-typst-template/examples/cookbook.pdf) | Schnipsel für häufige Aufgaben, siehe [Kochbuch](./cookbook) |

- [Bachelorarbeit](./thesis) zeigt eine auf mehrere Dateien verteilte Abschlussarbeit.
- [Belegarbeit](./report) zeigt kleinere Arbeiten.
- [Kochbuch](./cookbook) sammelt Schnipsel für häufige Aufgaben.

::: info
Die Beispiele im Repository importieren das Template mit `#import "../lib.typ": *` und werden im Verzeichnis des Templates mit `typst compile --root . examples/simple.typ` kompiliert. Die eigene Arbeit importiert stattdessen `@local/dhsnarticle:0.1.0`.
:::
