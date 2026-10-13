---
title: FAQ
---

# FAQ

## Kompilieren

### file not found

Pfade sind relativ zu der Datei, in der sie stehen. `image("images/logo.png")` in `chapters/basics.typ` sucht nach `chapters/images/logo.png`.
Verwende `../images/logo.png` oder einen Pfad, der beim Verzeichnis der Hauptdatei beginnt, etwa `/images/logo.png`.

### access denied / file is outside of the project root

Typst liest nur Dateien innerhalb des Verzeichnisses der Hauptdatei. Werden Dateien daneben benötigt, übergib mit `typst compile --root .. document.typ` ein Verzeichnis weiter oben.

### package not found (searched for @local/dhsnarticle:0.1.0)

Das Template liegt nicht im Verzeichnis für lokale Pakete oder das Verzeichnis heißt falsch. Die Datei `typst.toml` muss direkt in `.../typst/packages/local/dhsnarticle/0.1.0/` liegen. Siehe [Einrichtung des Templates](setup/template.md).

### label does not exist in the document

Ein Verweis wie `@name` zeigt auf ein Label, das nicht definiert ist. Labels von Abbildungen, Tabellen und Quelltexten setzt das Argument `label`, ohne Angabe ist es die Beschriftung. Eine Beschriftung mit Leerzeichen muss mit `#ref(label("die Beschriftung"))` referenziert werden.

### label occurs multiple times in the document

Zwei Elemente teilen sich ein Label, z. B. zwei Abbildungen mit derselben Beschriftung und ohne Argument `label`, oder eine Abbildung und eine Quelle des Literaturverzeichnisses. Gib einem von beiden ein anderes `label`.

### unknown variable

Eine Funktion des Templates wird in einer Datei verwendet, in der oben `#import "@local/dhsnarticle:0.1.0": *` fehlt. Jede Datei braucht den Import.

### unknown font family

Die Schriften „New Computer Modern“ und „DejaVu Sans Mono“ sind Teil des Compilers. Die Warnung erscheint nur bei einem Compiler, der ohne eingebettete Schriften gebaut wurde, etwa aus manchen Linux-Distributionen. Installiere die Schriften oder nutze das offizielle Release.

### layout did not converge within 5 attempts

Die Seitenzahlen in den Verzeichnissen hängen von der Länge der Verzeichnisse selbst ab. Selten springt ein Dokument zwischen zwei Zuständen hin und her. Ein `#pagebreak()` vor der betroffenen Stelle löst das.

## Inhalt

### `?key?` erscheint in Rot

`#gls("key")` verweist auf eine Abkürzung oder einen Glossareintrag, der nicht definiert ist. Prüfe die Schlüssel von `acronyms` und `glossary`.

### Eine Abkürzung fehlt im Abkürzungsverzeichnis

Das Verzeichnis enthält nur Abkürzungen, die mindestens einmal mit `gls` verwendet werden.

### Das Abbildungs-, Tabellen- oder Quelltextverzeichnis fehlt

Verzeichnisse ohne Eintrag werden weggelassen. Einträge erzeugen nur `dhsnfigure`, `dhsntable` und `dhsncode` außerhalb des Anhangs.

### Ein Sonderzeichen verschwindet oder führt zu einem Fehler

`#`, `*`, `_`, `@`, `$`, `<` und Backticks haben in Typst eine Bedeutung. Setze einen Backslash davor, z. B. `\#` oder `user\@example.org`. In Text in Anführungszeichen brauchen nur `"` und `\` einen Backslash.

### Zwei Fußnoten direkt hintereinander sehen aus wie eine Zahl

Trenne sie mit `#super[,]`, z. B. `#vglcite(<a>)#super[,]#vglcite(<b>)`.

### „ebenda“ erscheint, obwohl die Quelle auf dieser Seite zum ersten Mal zitiert wird

Das Template kann nicht wissen, auf welcher Seite eine Fußnote landet. Prüfe diese Fälle ganz am Ende und erzwinge das volle Zitat, indem du mit anderen Seiten zitierst oder umstellst.
Siehe [Zitate](usage/citations.md).

### Der Titel passt nicht in die Kopfzeile

Verwende `headertitle: "Ein kürzerer Titel"` oder `header: false`.

### Warum steht der Titel über jeder Seite?

Das ist das Verhalten der LaTeX-Vorlage, die den Titel standardmäßig in die Kopfzeile setzt. `header: false` entfernt die Kopfzeile.

### Warum sind Abbildungen umrahmt, auch im Anhang?

`dhsnfigure` zeichnet wie `bafigure` der LaTeX-Vorlage immer einen Rahmen um seinen Inhalt. Soll etwas ohne Rahmen erscheinen, setze es in `dhsntable` oder direkt ins Dokument.

### Eine Tabelle oder Abbildung soll über mehrere Seiten gehen

`dhsnfigure` und `dhsntable` halten ihren Inhalt auf einer Seite. Teile den Inhalt auf oder setze eine `table` direkt ins Dokument.

## Ausgabe

### Wie erzeuge ich eine PDF/A-Datei?

`typst compile --pdf-standard a-2b document.typ`

### Wie exportiere ich eine einzelne Seite als Bild?

`typst compile --pages 1 --ppi 150 document.typ title.png`

### Wie ändere ich etwas, das das Template festlegt?

Setze set- und show-Regeln hinter die show-Regel des Templates, z. B. `#set text(font: "Libertinus Serif")` für eine andere Schrift. Bedenke, dass die Arbeit dann womöglich nicht mehr dem Leitfaden entspricht.

### Wie bekomme ich eine neuere Version des Templates?

Installiere die neue Version von der Seite [Releases](https://github.com/xNycrofox/dhsn-typst-template/releases) neben der alten und ändere die Version im Import, siehe [Einrichtung des Templates](setup/template.md).
