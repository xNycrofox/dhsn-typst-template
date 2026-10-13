---
title: Citations
sort: 5
---

# Citations and bibliography

The template uses Typst's bibliography management to deal with the bibliography and citations and provides a customized citation style (`dhsn.csl`) for it, which is automatically loaded in both modes.
Feel free to consult the documentation of [bibliography](https://typst.app/docs/reference/model/bibliography/) and [cite](https://typst.app/docs/reference/model/cite/).

At first it is required to set up a bibliography database.
One needs to create a file with the `.bib` extension in the file tree. Typst's own `.yaml` format works as well.

```text
somedirectory
|-document.bib
|-document.typ
```

That bibliography file needs to be passed to the template using `bibliography: bibliography("document.bib")` in simple mode. In normal mode put `#bibliography("document.bib")` where the bibliography should be printed.
Such file consists of multiple entries, which each requiring a type and a citekey.
This template covers the `@article`, `@book`, `@online`, `@collection`, `@incollection`, `@unpublished` with attributes as shown below.

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

```warning
 Additional attributes should not be required and may use a wrong formatting. The same holds true for other entry types. Be aware.
```

```warning
 Typst ignores the `subtitle` attribute, so the subtitle has to be appended to the `title`. The names of the people publishing a `@collection` belong into the `editor` attribute.
```

Now one can create references in the `.typ` file.
Referring to sources in the text can be achieved with the `#bacite(<citekey>)` function for direct citations and the `#vglcite(<citekey>)` function for indirect citations.
Quotation marks in the text are automatically converted to german ones.
The optional content given to the cite functions in the brackets describes the pages, where the information can be found in the sources.
`@citekey[29]` is a shorthand for `#bacite(<citekey>)[29]`.
Footnotes for citations and the final bibliography are generated automatically.
In case one needs to chain multiple cite functions one after another, they should be separated using `#super[,]`.

```typst
#show: basimple.with(
  ...,
  bibliography: bibliography("document.bib"),
)

= Caption
indirect citation.#vglcite(<cloudcomp>)[17-21]
"direct citation"#bacite(<cloudcomp>)[29]
```

```warning
 Repeated citations of the same source are replaced with "ebenda". This also happens for the first citation on a page and after the source has been used with `captioncite` directly before. Check these cases manually.
```

## What the result looks like

The first citation of a source names the authors and the year. A citation directly following a citation of the same source is replaced with "ebenda".

| Code                                  | Footnote                                              |
| ------------------------------------- | ----------------------------------------------------- |
| `#vglcite(<cloudcomp>)[17-21]`        | Vgl. Rittinghouse, J. W./Ransome, J. F. (2018), S. 17-21. |
| `#bacite(<cloudcomp>)[29]`            | ebenda, S. 29.                                        |
| `@rpa[115]`                           | Czarnecki, C./Auth, G. (2018), S. 115.                |
| `#vglcite(<cloudcomp>)`               | Vgl. Rittinghouse, J. W./Ransome, J. F. (2018).       |
| `#captioncite(<cloudcomp>)[12]`       | no footnote, prints "Rittinghouse, J. W./Ransome, J. F. (2018), S. 12" in place |

The entries of the bibliography are sorted by author and look like this:

```text
Company (2021): Top Secret, internes Dokument.

Czarnecki, C./Auth, G. (2018): Prozessdigitalisierung durch Robotic Process Automation, in: Barton, T. H./Müller, C./Seel, C. (Hrsg.), Digitalisierung in Unternehmen. Von den theoretischen Ansätzen zur praktischen Umsetzung, Wiesbaden, S. 113–132.

Rittinghouse, J. W./Ransome, J. F. (2018): Cloud Computing. Implementation, Management and Security, Boca Raton.
```

Some details:

- Sources with more than three authors are shortened to the first author followed by "et al.".
- Multiple sources of the same authors and year are distinguished with a letter behind the year, e.g. "(2018a)".
- Only sources, which are cited, are listed in the bibliography. `#bibliography("document.bib", full: true)` lists all sources.
- The title of the bibliography is "Literatur". It can be changed with `bibliography("document.bib", title: "Literaturverzeichnis")`.
- "S." is put in front of the pages automatically. Do not write it yourself.

## Citing in captions

The source of a figure, table or code must not create a footnote. Use `captioncite` for it.

```typst
#bafigure(source: captioncite(<cloudcomp>)[12])[The caption][
  #image("images/diagram.png")
]
// in case the figure was modified
#bafigure(source: [in Anlehnung an #captioncite(<cloudcomp>)[12]])[The caption][
  #image("images/diagram.png")
]
```

## Using another bibliography format

Typst also reads its own [Hayagriva](https://github.com/typst/hayagriva/blob/main/docs/file-format.md) format, which is easier to write by hand.

```yaml
cloudcomp:
  type: book
  title: Cloud Computing. Implementation, Management and Security
  author: ["Rittinghouse, John W.", "Ransome, James F."]
  date: 2018
  location: Boca Raton
```

Tools like [Zotero](https://www.zotero.org/) and [JabRef](https://www.jabref.org/) manage sources and export `.bib` files.
