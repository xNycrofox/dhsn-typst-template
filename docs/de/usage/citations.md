---
title: Zitate
---

# Zitate und Literaturverzeichnis

Das Template nutzt die Literaturverwaltung von Typst für Literaturverzeichnis und Zitate und bringt dafür einen eigenen Zitierstil (`dhsn.csl`) mit, der in beiden Modi automatisch geladen wird.
Mehr dazu steht in der Dokumentation von [bibliography](https://typst.app/docs/reference/model/bibliography/) und [cite](https://typst.app/docs/reference/model/cite/).

Zuerst braucht es eine Literaturdatenbank.
Dafür legt man eine Datei mit der Endung `.bib` an. Typsts eigenes `.yaml`-Format funktioniert ebenfalls.

```text
somedirectory
|-document.bib
|-document.typ
```

Diese Datei wird dem Template im einfachen Modus mit `bibliography: bibliography("document.bib")` übergeben. Im normalen Modus setzt man `#bibliography("document.bib")` an die Stelle, an der das Literaturverzeichnis stehen soll.
Die Datei besteht aus Einträgen, die jeweils einen Typ und einen Citekey brauchen.
Das Template deckt `@article`, `@book`, `@online`, `@collection`, `@incollection` und `@unpublished` mit den unten gezeigten Attributen ab.

```text
% cloudcomp is the citekey for this entry
@book{cloudcomp,
    author = {John W. Rittinghouse and James F. Ransome},
    title = {Cloud Computing. Implementation, Management and Security},
    location = {Boca Raton},
    year = {2018}
}
@article{clouderp,
    author = {Mohamed A. Abd Elmonem and Eman S. Nasr and Mervat H. Geith},
    title = {Benefits and challenges of cloud ERP systems. A systematic literature review},
    journal = {Future Computing and Informatics Journal},
    number = {1},
    year = {2016},
    pages = {1-9}
}
@online{itmgmtdef,
    author = {Olaf Resch},
    title = {IT-Management. ...},
    url = {...},
    urldate = {2020-05-23},
    year = {2019}
}
% @collection and @incollection usally go together
@collection{reinheimercloud,
    title = {Cloud Computing. Die Infrastruktur der Digitalisierung},
    location = {Wiesbaden},
    year = {2018},
    editor = {Stefan Reinheimer}
}
@incollection{hentschelcloud,
    author = {Raoul Hentschel and Christian Leyh},
    title = {Cloud Computing. Status quo, aktuelle Entwicklungen und Herausforderungen},
    % notice the crossref to the collection
    crossref = {reinheimercloud},
    pages = {3-30}
}
@unpublished{internal,
    author = { {Company with spaces in the name} },
    title = {Top Secret},
    year = {2021}
}
```

::: warning
Weitere Attribute sollten nicht nötig sein und werden womöglich falsch formatiert. Dasselbe gilt für andere Eintragstypen.
:::

::: warning
Typst ignoriert das Attribut `subtitle`, der Untertitel muss an den `title` angehängt werden. Die Namen der Herausgeber einer `@collection` gehören in das Attribut `editor`.
:::

Jetzt lassen sich in der `.typ`-Datei Verweise setzen.
Auf Quellen verweist man im Text mit `#dhsncite(<citekey>)` für direkte Zitate und `#vglcite(<citekey>)` für indirekte Zitate.
Anführungszeichen im Text werden automatisch in deutsche umgewandelt.
Der optionale Inhalt in den eckigen Klammern hinter den Zitierfunktionen nennt die Seiten, auf denen die Information in der Quelle steht.
`@citekey[29]` ist eine Kurzform für `#dhsncite(<citekey>)[29]`.
Fußnoten für Zitate und das Literaturverzeichnis am Ende entstehen automatisch.
Folgen mehrere Zitierfunktionen direkt aufeinander, trennt man sie mit `#super[,]`.

```typst
#show: dhsnsimple.with(
  ...,
  bibliography: bibliography("document.bib"),
)

= Caption
indirect citation.#vglcite(<cloudcomp>)[17-21]
"direct citation"#dhsncite(<cloudcomp>)[29]
```

::: warning
Wiederholte Zitate derselben Quelle werden durch „ebenda“ ersetzt. Das passiert auch beim ersten Zitat auf einer Seite und wenn die Quelle direkt davor mit `captioncite` verwendet wurde. Diese Fälle bitte von Hand prüfen.
:::

## So sieht das Ergebnis aus

Das erste Zitat einer Quelle nennt Autoren und Jahr. Ein Zitat, das direkt auf ein Zitat derselben Quelle folgt, wird durch „ebenda“ ersetzt.

| Code                                  | Fußnote                                               |
| ------------------------------------- | ----------------------------------------------------- |
| `#vglcite(<cloudcomp>)[17-21]`        | Vgl. Rittinghouse, J. W./Ransome, J. F. (2018), S. 17-21. |
| `#dhsncite(<cloudcomp>)[29]`          | ebenda, S. 29.                                        |
| `@rpa[115]`                           | Czarnecki, C./Auth, G. (2018), S. 115.                |
| `#vglcite(<cloudcomp>)`               | Vgl. Rittinghouse, J. W./Ransome, J. F. (2018).       |
| `#captioncite(<cloudcomp>)[12]`       | keine Fußnote, gibt an Ort und Stelle „Rittinghouse, J. W./Ransome, J. F. (2018), S. 12“ aus |

Die Einträge des Literaturverzeichnisses sind nach Autor sortiert und sehen so aus:

```text
Company (2021): Top Secret, internes Dokument.

Czarnecki, C./Auth, G. (2018): Prozessdigitalisierung durch Robotic Process Automation, in: Barton, T. H./Müller, C./Seel, C. (Hrsg.), Digitalisierung in Unternehmen. Von den theoretischen Ansätzen zur praktischen Umsetzung, Wiesbaden, S. 113–132.

Rittinghouse, J. W./Ransome, J. F. (2018): Cloud Computing. Implementation, Management and Security, Boca Raton.
```

Einige Details:

- Quellen mit mehr als drei Autoren werden auf den ersten Autor mit „et al.“ gekürzt.
- Mehrere Quellen derselben Autoren aus demselben Jahr werden durch einen Buchstaben hinter dem Jahr unterschieden, z. B. „(2018a)“.
- Im Literaturverzeichnis stehen nur zitierte Quellen. `#bibliography("document.bib", full: true)` listet alle Quellen auf.
- Die Überschrift des Literaturverzeichnisses lautet „Literatur“. Ändern lässt sie sich mit `bibliography("document.bib", title: "Literaturverzeichnis")`.
- „S.“ wird automatisch vor die Seiten gesetzt und darf nicht selbst geschrieben werden.

## In Beschriftungen zitieren

Die Quelle einer Abbildung, einer Tabelle oder eines Quelltexts darf keine Fußnote erzeugen. Dafür gibt es `captioncite`.

```typst
#dhsnfigure(source: captioncite(<cloudcomp>)[12])[The caption][
  #image("images/diagram.png")
]
// in case the figure was modified
#dhsnfigure(source: [in Anlehnung an #captioncite(<cloudcomp>)[12]])[The caption][
  #image("images/diagram.png")
]
```

## Ein anderes Literaturformat verwenden

Typst liest auch sein eigenes Format [Hayagriva](https://github.com/typst/hayagriva/blob/main/docs/file-format.md), das sich leichter von Hand schreiben lässt.

```yaml
cloudcomp:
  type: book
  title: Cloud Computing. Implementation, Management and Security
  author: ["Rittinghouse, John W.", "Ransome, James F."]
  date: 2018
  location: Boca Raton
```

Werkzeuge wie [Zotero](https://www.zotero.org/) und [JabRef](https://www.jabref.org/) verwalten Quellen und exportieren `.bib`-Dateien.
