---
title: Referenz
---

# Referenz

Alle Funktionen des Templates. Argumente ohne Standardwert in den Tabellen sind ebenfalls optional, hinterlassen aber Lücken im Dokument.

## Dokument einrichten

### dhsnsimple

Richtet das Dokument ein und erzeugt alle Teile rund um den Inhalt. Verwendung: `#show: dhsnsimple.with(...)`. Beschrieben unter [Einfacher Modus](./simple).

| Argument          | Typ                        | Standard         | Beschreibung                                            |
| ----------------- | -------------------------- | ---------------- | ------------------------------------------------------- |
| `first`           | Text                       |                  | Vorname des Verfassers                                  |
| `last`            | Text                       |                  | Nachname des Verfassers                                 |
| `company`         | Text                       |                  | Unternehmen des Verfassers                              |
| `location`        | Text                       |                  | Ort der Hochschule                                      |
| `linkcoloring`    | Wahrheitswert              | `false`          | färbt Links                                             |
| `header`          | Wahrheitswert              | `true`           | zeigt den Titel in der Kopfzeile                        |
| `headertitle`     | Text                       | der Titel        | Text der Kopfzeile, höchstens 80 Zeichen                |
| `codetheme`       | Text oder `none`           | `"github-light"` | `"github-light"`, `"github-dark"` oder `none`           |
| `img`             | Bild                       |                  | Logo auf der Titelseite                                 |
| `course`          | Text                       |                  | Studiengang                                             |
| `title`           | Text                       |                  | Titel der Arbeit                                        |
| `number`          | Zahl oder Text             |                  | Matrikelnummer                                          |
| `corrector`       | Array oder Text            | `()`             | Gutachter                                               |
| `themedate`       | Datum oder Text            |                  | Tag der Themenübergabe                                  |
| `returndate`      | Datum oder Text            |                  | Tag der Einreichung                                     |
| `signature`       | Bild                       |                  | Unterschrift des Verfassers                             |
| `companylocation` | Text                       |                  | Ort des Unternehmens                                    |
| `type`            | Text                       | Pflicht          | `"thesis"`, `"master-thesis"`, `"study"`, `"report"` oder eigener Text |
| `degreetype`      | Text                       | `"Science"`      | Abschluss bei Abschlussarbeiten                         |
| `assignment`      | Bild                       | `none`           | Aufgabenstellung der Arbeit, in der Regel eine PDF-Datei |
| `blocknotice`     | Wahrheitswert              | `true`           | fügt den Sperrvermerk ein                               |
| `ainotice`        | Wahrheitswert              | `false`          | fügt den Hinweis zu generativer KI ein                  |
| `aimodel`         | Array oder Text            | `()`             | verwendete KI-Modelle                                   |
| `gendernotice`    | Wahrheitswert              | `false`          | fügt den Hinweis zur sprachlichen Gestaltung ein        |
| `abstract`        | Inhalt                     | `none`           | Abstract                                                |
| `abstractintoc`   | Wahrheitswert              | `false`          | nimmt das Abstract ins Inhaltsverzeichnis auf           |
| `acronyms`        | Dictionary                 | `(:)`            | Abkürzungen, Kurzform zu Langform                       |
| `glossary`        | Dictionary                 | `(:)`            | Glossareinträge mit `name` und `description`            |
| `bibliography`    | Literaturverzeichnis       | `none`           | `bibliography("document.bib")`                          |

Die Teile entstehen in dieser Reihenfolge: Titelseite, Aufgabenstellung, Sperrvermerk, KI-Hinweis, Hinweis zur sprachlichen Gestaltung, Abstract, Inhaltsverzeichnis, Abbildungsverzeichnis, Abkürzungsverzeichnis, Glossar, Tabellenverzeichnis, Quelltextverzeichnis, **Inhalt**, Literaturverzeichnis, eidesstattliche Erklärung.

### dhsnarticle

Richtet Seite, Schriften, Abstände, Überschriften, Verzeichnisse, Beschriftungen und den Zitierstil ein, ohne Inhalt zu erzeugen. Verwendung: `#show: dhsnarticle.with(...)`. Beschrieben unter [Normaler Modus](./normal).

Nimmt die Argumente `first`, `last`, `company`, `location`, `linkcoloring`, `header`, `headertitle` und `codetheme` von `dhsnsimple` entgegen.

## Teile der Arbeit

| Funktion                                   | Beschreibung                                                            |
| ------------------------------------------ | ----------------------------------------------------------------------- |
| `mktitle(title, img, course, number, corrector, themedate, returndate, type, degreetype)` | Titelseite |
| `mkblocknotice(signature, date, location)` | Sperrvermerk, `location` ist der Ort des Unternehmens                   |
| `mkainotice(model)`                        | Hinweis zur Nutzung generativer KI                                      |
| `mkgendernotice()`                         | Hinweis zur sprachlichen Gestaltung                                     |
| `mkfrontmatter(abbreviations)`             | Inhaltsverzeichnis und weitere Verzeichnisse, wechselt danach auf arabische Seitenzahlen |
| `mkaffirmation(signature, date)`           | eidesstattliche Erklärung                                               |

Alle Argumente außer dem von `mkfrontmatter` sind benannt, z. B. `#mkainotice(model: ("GPT-4o",))`.

## Abkürzungen und Glossar

| Funktion                                         | Beschreibung                                                   |
| ------------------------------------------------ | -------------------------------------------------------------- |
| `newacronym(key, short, long)`                   | definiert eine Abkürzung                                       |
| `newglossaryentry(key, name: .., description: ..)` | definiert einen Glossareintrag                               |
| `gls(key)`                                       | verweist auf eine Abkürzung oder einen Eintrag, die erste Verwendung einer Abkürzung gibt die Langform aus |
| `printacronyms(title: "Abkürzungsverzeichnis")`  | gibt das Verzeichnis der verwendeten Abkürzungen aus           |
| `printglossary(title: "Glossar")`                | gibt die verwendeten Glossareinträge aus                       |

## Umgebungen

| Funktion                                                 | Beschreibung                                  |
| -------------------------------------------------------- | --------------------------------------------- |
| `dhsnfigure(source: .., label: .., placement: ..)[Beschriftung][Inhalt]` | gerahmte Abbildung            |
| `dhsntable(source: .., label: .., placement: ..)[Beschriftung][Inhalt]`  | Tabelle                       |
| `dhsncode(source: .., label: ..)[Beschriftung][Inhalt]`  | Quelltext                                     |
| `dhsnappx[Inhalt]`                                       | Anhang                                        |
| `addtoappx[Beschriftung]`                                | Eintrag im Anhangverzeichnis                  |
| `theappx()`                                              | Nummer des letzten Anhangs                    |

Beschrieben unter [Umgebungen](./environments).

## Zitate

| Funktion                       | Beschreibung                                               |
| ------------------------------ | ---------------------------------------------------------- |
| `dhsncite(key)[Seiten]`        | direktes Zitat in einer Fußnote                            |
| `vglcite(key)[Seiten]`         | indirektes Zitat in einer Fußnote, beginnt mit „Vgl.“      |
| `captioncite(key)[Seiten]`     | Zitat ohne Fußnote für Beschriftungen                      |

Der Schlüssel ist ein Label wie `<cloudcomp>` oder Text wie `"cloudcomp"`. Die Seiten sind optional. Beschrieben unter [Zitate](./citations).

## Hilfsfunktionen

| Funktion                                   | Beschreibung                                                 |
| ------------------------------------------ | ------------------------------------------------------------ |
| `today()`                                  | das aktuelle Datum, z. B. „13. Oktober 2026“                 |
| `format-date(date)`                        | gibt ein `datetime` auf Deutsch aus, alles andere unverändert |
| `paper-type(type, degreetype: .., course: ..)` | Text der Titelseite, der die Art der Arbeit beschreibt   |
| `ai-models(model)`                         | Satz, der die KI-Modelle nennt                               |
| `env-caption(title, source: ..)`           | Beschriftung mit Quellenangabe                               |

## Formatierung durch das Template

| Eigenschaft          | Wert                                                             |
| -------------------- | ---------------------------------------------------------------- |
| Papier               | A4, Ränder 3 cm links, 2 cm rechts, 3 cm oben (2 cm ohne Kopfzeile), 2 cm unten |
| Schrift              | New Computer Modern, 12pt                                        |
| Text                 | Blocksatz, deutsche Silbentrennung, 1,5-facher Zeilenabstand     |
| Absätze              | kein Einzug, eine Leerzeile dazwischen                           |
| Überschriften        | nummeriert, fett, 17,28pt, 14,4pt und 12pt                       |
| Seitenzahlen         | unten rechts, römisch im Vorspann, danach arabisch               |
| Kopfzeile            | Titel der Arbeit mit einer Linie darunter                        |
| Beschriftungen       | 10pt, zentriert, unter dem Inhalt                                |
| Quelltext            | DejaVu Sans Mono, 9pt, gerahmt, mit Zeilennummern                |
| Fußnoten             | 10pt, einfacher Zeilenabstand                                    |
| Literaturverzeichnis | einfacher Zeilenabstand, nach Autor sortiert                     |
