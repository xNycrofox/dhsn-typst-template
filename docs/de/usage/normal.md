---
title: Normaler Modus
---

# Normaler Modus

Ohne den einfachen Modus wird die Benutzung des Templates etwas ausführlicher, dafür deutlich flexibler.
Nötig ist der normale Modus meist nur bei besonderen Anforderungen, die vom Leitfaden abweichen, z. B. einer anderen Reihenfolge der Elemente.

Zunächst die Grundstruktur des Dokuments.
Die Funktion `dhsnarticle` richtet Seite, Schriften, Abstände und den Zitierstil „dhsn“ ein, der für korrekte Zitate und ein korrektes Literaturverzeichnis sorgt.
Ihre Optionen sind im Abschnitt zum [einfachen Modus](./simple) beschrieben.

```typst
#import "@local/dhsnarticle:0.1.0": *

#show: dhsnarticle.with(first: "firstname", last: "lastname", company: "comp", location: "Dresden")
// Additional packages and show rules should probably go here

#mktitle(
  title: "Test Report",
  img: image("images/logo.png"),
  course: "science",
  number: 1234,
  corrector: ("corrector 1", "corrector 2"),
  themedate: today(),
  returndate: today(),
  type: "thesis",
)
#mkblocknotice(
  signature: image("images/signature.png"),
  date: today(),
  location: "Dresden",
)
#mkainotice(model: ("GPT-4omini", "DALL-E"))
#mkfrontmatter[
  #heading(numbering: none)[Abkürzungsverzeichnis]
]
// Content here
#bibliography("document.bib")
#mkaffirmation(
  signature: image("images/signature.png"),
  date: today(),
)
```

Die Elemente am Anfang und Ende der Arbeit lassen sich so beliebig umstellen. Die Funktionen im Überblick:

- `mktitle` erzeugt die Titelseite
  - `title` ist der Titel der Arbeit
  - `img` ist das Logo der Hochschule
  - `course` ist dein Studiengang
  - `number` ist deine Matrikelnummer
  - `corrector` ist ein Array oder eine kommagetrennte Liste der Gutachter
  - `themedate` ist der Tag der Themenübergabe
  - `returndate` ist der Tag der Einreichung
  - `type` legt die Art der Arbeit fest: `"thesis"`, `"master-thesis"`, `"study"` oder `"report"`. Jeder andere Wert wird selbst als Bezeichnung ausgegeben. Der Parameter `type` ist Pflicht.
  - `degreetype` legt den Abschluss fest, Standard ist `"Science"`
- `mkblocknotice` erzeugt den Sperrvermerk
  - `signature` ist ein Bild deiner Unterschrift
  - `date` ist der Tag der Einreichung
  - `location` ist der Ort deines Unternehmens
- `mkgendernotice` erzeugt einen Hinweis zur sprachlichen Gestaltung
- `mkfrontmatter` erzeugt Inhalts-, Abbildungs-, Abkürzungs-, Tabellen- und Quelltextverzeichnis und wechselt danach auf arabische Seitenzahlen
  - Abbildungs-, Tabellen- und Quelltextverzeichnis entstehen nur, wenn sie Einträge haben
  - das einzige Argument beschreibt, wie das Abkürzungsverzeichnis erzeugt wird. Gibt es keines, übergib `[]`.
  - statt `mkfrontmatter` lässt sich der gesamte Vorspann auch selbst mit Standardfunktionen von Typst wie `outline` aufbauen
- `mkainotice` erzeugt einen Hinweis zur Nutzung generativer künstlicher Intelligenz
  - `model` ist ein Array oder eine kommagetrennte Liste der verwendeten KI-Modelle
- `mkaffirmation` erzeugt die eidesstattliche Erklärung
  - `signature` ist ein Bild deiner Unterschrift
  - `date` ist der Tag der Einreichung

::: info
Titelseite, Vermerke und eidesstattliche Erklärung stehen immer auf einer eigenen Seite ohne Kopfzeile und Seitenzahl. Die Kopfzeile zeigt den Titel, der `mktitle` übergeben wurde.
:::

## Abkürzungen und Glossar des Templates verwenden

Wer die Abkürzungen des Templates nutzen möchte, definiert sie mit `newacronym` und `newglossaryentry` und gibt die Verzeichnisse mit `printacronyms` und `printglossary` aus, wie unten gezeigt.
Beide Verzeichnisse entstehen nur, wenn sie einen Eintrag haben, der mit `gls` verwendet wird.

```typst
#import "@local/dhsnarticle:0.1.0": *

#show: dhsnarticle.with(first: "firstname", last: "lastname", company: "comp", location: "Dresden")

#newacronym("HTTP", "HTTP", "Hypertext Transfer Protocol")
#newglossaryentry(
  "cloud",
  name: "Cloud Computing",
  description: [Cloud computing is the on-demand availability of computer system resources.],
)

...
#mkfrontmatter[
  #printacronyms()
  #printglossary()
]
...
#gls("HTTP") and #gls("cloud")
```

Andere Pakete für Abkürzungen wie [glossarium](https://typst.app/universe/package/glossarium) funktionieren ebenfalls. Ihr Verzeichnis gibt man im Argument von `mkfrontmatter` aus.
