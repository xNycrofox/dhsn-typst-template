// Typst template implementing the DHSN Dresden Styleguide
// Counterpart of the `dhsnarticle` LaTeX document class, comments refer to the LaTeX commands where helpful

// ---------------------------------------------------------------------------
// Internal state
// ---------------------------------------------------------------------------

// options given to `dhsnarticle` (first, last, company, location)
#let _config = state("dhsn-config", (first: none, last: none, company: none, location: none))
// title of the paper, set by `mktitle` and shown in the header
#let _title = state("dhsn-title", none)
// numbering pattern of the page numbers, roman in the frontmatter and arabic afterwards
#let _page-numbering = state("dhsn-page-numbering", "I")
// whether the `dhsnappx` environment is active
#let _in-appx = state("dhsn-in-appx", false)
// whether content is currently rendered as part of an outline (ToC, LoF, LoT, ...)
#let _in-outline = state("dhsn-in-outline", false)
// defined acronyms and glossary entries and the keys already referenced with `gls`
#let _acronyms = state("dhsn-acronyms", (:))
#let _glossary = state("dhsn-glossary", (:))
#let _gls-used = state("dhsn-gls-used", (:))

// ---------------------------------------------------------------------------
// Lengths, matching a 12pt LaTeX article with \onehalfspacing
// ---------------------------------------------------------------------------

#let _font-size = 12pt
// LaTeX font sizes relative to 12pt
#let _sizes = (footnotesize: 10pt, small: 10.95pt, large: 14.4pt, Large: 17.28pt, Huge: 24.88pt)
// cap height of the font, Typst measures line distances from there
#let _cap-height = 0.683em
// distance of two baselines is 1.5em (\onehalfspacing)
#let _leading = 1.5em - _cap-height
// an empty line between paragraphs (\parskip = \baselineskip)
#let _par-spacing = 3em - _cap-height
// line spacing used for single spaced parts (\singlespacing)
#let _single-leading = 1.2em - _cap-height

// kinds of the figures created by the environments
#let _appx-kind = "dhsn-appx"

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

#let _months = (
  "Januar",
  "Februar",
  "März",
  "April",
  "Mai",
  "Juni",
  "Juli",
  "August",
  "September",
  "Oktober",
  "November",
  "Dezember",
)

// helper to print a date the way \today does with ngerman babel
// anything, which is not a datetime, is returned as is
#let format-date(date) = {
  if type(date) == datetime {
    str(date.day()) + ". " + _months.at(date.month() - 1) + " " + str(date.year())
  } else {
    date
  }
}

// the current date, the counterpart of \today
#let today() = format-date(datetime.today())

// helper to convert a comma separated string or an array to an array
#let _as-list(value) = {
  if value == none {
    ()
  } else if type(value) == str {
    value.split(",").map(v => v.trim()).filter(v => v != "")
  } else if type(value) == array {
    value
  } else {
    (value,)
  }
}

// helper to convert a path or already loaded content to an image
// paths are resolved relative to this file, so only paths starting at the
// project root (e.g. "/images/logo.png") work, prefer passing `image(...)`
#let _as-image(value, ..args) = {
  if value == none {
    none
  } else if type(value) == str {
    image(value, ..args)
  } else {
    set image(..args)
    value
  }
}

// helper to convert the type of the paper to an actual text
#let paper-type(type, degreetype: "Science", course: none) = {
  if type == none {
    panic(
      "no type is being set for `mktitle`. "
        + "When using `mktitle` make sure to specify the parameter `type` with a value. "
        + "For more information see the documentation of the normal mode.",
    )
  }
  if degreetype == none {
    degreetype = "Science"
  }
  if type == "thesis" [
    Bachelorarbeit \
    zur Erlangung des Abschlusses Bachelor of #degreetype \
    im Studiengang #course
  ] else if type == "master-thesis" [
    Masterarbeit \
    zur Erlangung des Abschlusses Master of #degreetype \
    im Studiengang #course
  ] else if type == "study" [
    Studienarbeit
  ] else if type == "report" [
    Belegarbeit
  ] else {
    // enables custom title
    type
  }
}

// helper to print the sentence naming the artificial intelligence models used
#let ai-models(model) = {
  let models = _as-list(model)
  if models.len() == 1 [
    Als Modell wurde #models.first() verwendet.
  ] else if models.len() > 1 [
    Als Modelle wurden #models.join(", ") verwendet.
  ]
}

// Environment caption
#let env-caption(title, source: none) = {
  if source == none or source == "" or source == [] [
    #title (Quelle: eigene Darstellung)
  ] else [
    #title (Quelle: #source)
  ]
}

// unnumbered heading with a ToC entry, used for the ToC, LoF, LoT, ...
#let _list-heading(body) = heading(numbering: none, outlined: true, body)

// heading of the notices, never listed in the ToC
#let _notice-heading(level: 3, body) = heading(
  level: level,
  numbering: none,
  outlined: false,
  bookmarked: false,
  body,
)

// page without header and page number (\thispagestyle{empty})
#let _empty-page(body) = page(header: none, footer: none, body)

// ---------------------------------------------------------------------------
// Document setup
// ---------------------------------------------------------------------------

// colors of the github themes, used for code blocks
#let _code-themes = (
  github-light: (background: rgb("#ffffff"), linenumber: rgb("#babbbd")),
  github-dark: (background: rgb("#24292e"), linenumber: rgb("#444d56")),
)

// Sets up page, fonts, spacing, headings, lists, captions and the bibliography style
// Use it with `#show: dhsnarticle.with(...)`
#let dhsnarticle(
  // first name of the author
  first: none,
  // last name of the author
  last: none,
  // company the author works at
  company: none,
  // location of the university
  location: none,
  // if true links will be colored
  linkcoloring: false,
  // if false the title will not be shown in the header
  header: true,
  // if specified the header shows this text instead of the title
  // it's recommended to use a maximum length of 80 characters to prevent an overflow
  headertitle: none,
  // theme of code blocks, "github-light", "github-dark" or none to keep the Typst default
  codetheme: "github-light",
  body,
) = {
  _config.update((first: first, last: last, company: company, location: location))

  set page(
    paper: "a4",
    // adjust the page top spacing depending on whether header is shown or not
    margin: (left: 3cm, right: 2cm, top: if header { 3cm } else { 2cm }, bottom: 2cm),
    header-ascent: 22pt,
    footer-descent: 20pt,
    header: if header {
      context {
        let title = if headertitle != none { headertitle } else { _title.get() }
        if title != none {
          set par(leading: _single-leading, justify: false)
          block(below: 4pt, title)
          line(length: 100%, stroke: 0.4pt)
        }
      }
    },
    // Show the page number on the right side
    footer: context align(right, counter(page).display(_page-numbering.get())),
  )

  set text(font: "New Computer Modern", size: _font-size, lang: "de")
  // no paragraph indentation, an empty line after paragraphs and one and a half line spread
  set par(justify: true, leading: _leading, spacing: _par-spacing, first-line-indent: 0pt)

  // Headings
  set heading(numbering: "1.1")
  show heading: it => {
    let size = (_sizes.Large, _sizes.large, _font-size).at(calc.min(it.level, 3) - 1)
    set text(size: size, weight: "bold")
    set par(justify: false, leading: _single-leading)
    block(above: 2.3 * _font-size, below: 2.3 * _font-size, sticky: true, {
      if it.numbering != none {
        numbering(it.numbering, ..counter(heading).at(it.location()))
        h(1em)
      }
      it.body
    })
  }

  // Footnotes
  show footnote.entry: set par(leading: _single-leading, spacing: 0.8em)

  // Table of contents, list of figures, tables, codes and appendix entries
  show outline: it => {
    _in-outline.update(true)
    it
    _in-outline.update(false)
  }
  set outline.entry(fill: repeat([.], gap: 0.35em))
  show outline.entry: it => context {
    let element = it.element
    let loc = element.location()
    let page-number = numbering(_page-numbering.at(loc), ..counter(page).at(loc))
    let is-figure = element.func() == figure
    // entries of figures look like "Abbildung 1: Title"
    let prefix = if is-figure [#it.prefix():] else { it.prefix() }
    let entry = link(
      loc,
      it.indented(
        prefix,
        [#it.body()#box(width: 1fr, inset: (left: 0.4em, right: 0.6em), it.fill)#page-number],
      ),
    )
    if not is-figure and it.level == 1 {
      block(above: 2em, strong(entry))
    } else {
      block(above: _leading, entry)
    }
  }

  // Captions are smaller and long captions stay centered
  set figure.caption(separator: [: ])
  show figure.caption: set text(size: _sizes.footnotesize)
  show figure.caption: set par(justify: false, leading: _single-leading)
  show figure.where(kind: raw): set figure.caption(position: bottom)
  show figure.where(kind: table): set figure.caption(position: bottom)
  // code may span multiple pages
  show figure.where(kind: raw): set block(breakable: true)
  show figure.where(kind: _appx-kind): set block(breakable: true)

  // Code blocks
  show raw: set text(font: "DejaVu Sans Mono")
  show raw.where(block: true): set text(size: 9pt)
  show raw.where(block: true): set par(justify: false, leading: 0.6em)
  show: rest => {
    if codetheme == none {
      rest
    } else {
      let colors = _code-themes.at(codetheme)
      show raw.where(block: true): set raw(theme: "themes/" + codetheme + ".tmTheme")
      show raw.where(block: true): it => block(
        width: 100%,
        // adds a frame around the code
        stroke: 0.4pt + black,
        fill: colors.background,
        inset: 5pt,
        align(left, grid(
          columns: (auto, 1fr),
          column-gutter: 5pt,
          row-gutter: 0.6em,
          ..it
            .lines
            .map(line => (
              align(right, text(fill: colors.linenumber, size: 0.75em, str(line.number))),
              line,
            ))
            .flatten()
        )),
      )
      rest
    }
  }

  // hyperref config
  show: rest => {
    if linkcoloring {
      show link: it => {
        set text(fill: if type(it.dest) == str { rgb("#00aeef") } else { blue })
        it
      }
      show ref: set text(fill: blue)
      rest
    } else {
      // no coloring required, do nothing
      rest
    }
  }

  // Bibliography and citation style
  set bibliography(style: "dhsn.csl", title: "Literatur")
  show bibliography: set par(leading: _single-leading, spacing: 1.2em, justify: false)
  // citations are placed in footnotes, the cite commands of the template do that on their own
  show cite: it => if it.at("label", default: none) == <dhsn-cite> { it } else { footnote(it) }

  body
}

// ---------------------------------------------------------------------------
// Title page and notices
// ---------------------------------------------------------------------------

// Title Page
#let mktitle(
  // title of the paper
  title: none,
  // image, placed in the top right corner
  img: none,
  // course attended at the university
  course: none,
  // number of the author
  number: none,
  // correctors, an array or a comma separated string
  corrector: (),
  // date when the theme of the paper was announced
  themedate: none,
  // date when the paper has been handed in
  returndate: none,
  // type of paper (thesis etc...)
  type: none,
  // if type is thesis or master-thesis the degree type
  degreetype: "Science",
) = {
  let papertype = paper-type(type, degreetype: degreetype, course: course)
  _empty-page({
    _title.update(title)
    context {
      let config = _config.get()
      set par(justify: false)
      grid(
        columns: (1fr, auto),
        [
          Duale Hochschule Sachsen \
          Staatliche Studienakademie #config.location \
          Studiengang #course
        ],
        move(dy: -8pt, _as-image(img, width: 6.2 * 1.5 * _font-size)),
      )
      v(1fr)
      set align(center)
      text(size: _sizes.Huge, weight: "bold", par(leading: 0.5em, title))
      v(1fr)
      [
        #papertype \
        \
        #config.last, #config.first \
        #config.company \
        Matrikelnummer: #number
      ]
      v(1fr)
      set align(left)
      v(1fr)
      [
        #for c in _as-list(corrector) [Gutachter: #c \ ]
        \
        Tag der Themenübergabe: #format-date(themedate) \
        Tag der Einreichung: #format-date(returndate)
      ]
      v(1fr)
    }
  })
}

// Blocking notice
#let mkblocknotice(
  // signature of the author
  signature: none,
  // date when the paper is handed in
  date: none,
  // where the company is located at
  location: none,
) = _empty-page(context {
  let config = _config.get()
  _notice-heading[Sperrvermerk]
  [
    Die vorliegende Arbeit enthält vertrauliche Daten des Unternehmens #config.company.
    Auf Wunsch des Unternehmens #config.company ist die vorliegende Arbeit für die öffentliche Nutzung zu sperren.
    Veröffentlichung, Vervielfältigung und Einsichtnahme sind ohne ausdrückliche Genehmigung des Unternehmens #config.company, in #location und des Verfassers #config.first #config.last nicht gestattet.
    Die Arbeit ist nur den Gutachtern und den Mitgliedern des Prüfungsausschusses zugänglich zu machen.
  ]
  v(2em)
  set par(justify: false)
  grid(
    columns: (1fr, auto),
    align: (left + bottom, center + bottom),
    row-gutter: 0.8em,
    [#config.location, #format-date(date)], _as-image(signature, width: 28% * 16cm),
    [Ort, Datum], [Unterschrift des Verfassers],
  )
})

// artificial intelligence usage notice
#let mkainotice(
  // models used, an array or a comma separated string
  model: (),
) = _empty-page({
  _notice-heading(level: 2)[Hinweis zur Nutzung Generativer Künstlicher Intelligenz]
  [
    Die vorliegende wissenschaftliche Arbeit wurde mit Unterstützung einer generativen KI erstellt.
    #ai-models(model)
    Die Inhalte wurden auf Basis der Ausgabe der Künstlichen Intelligenz erstellt, wobei eine eigenständige Überprüfung und wissenschaftliche Validierung durch die Autorin bzw. den Autor erfolgte.
    Die Verantwortung für die Richtigkeit, Vollständigkeit und wissenschaftliche Relevanz der Arbeit liegt bei der Autorin bzw. dem Autor.
    Die Nutzung der KI erfolgte ausschließlich zur Unterstützung der Erstellung und Analyse von Textinhalten im Rahmen der wissenschaftlichen Arbeit.
  ]
})

// gender language notice
#let mkgendernotice() = _empty-page({
  _notice-heading[Hinweis zur sprachlichen Gestaltung]
  [
    In der vorliegenden Arbeit wird aus Gründen der Lesbarkeit ausschließlich das generische Maskulinum verwendet.
    Diese Entscheidung basiert auf der Zielsetzung, den Text sprachlich klar und prägnant zu gestalten.
    Die Verwendung des generischen Maskulinums ist hierbei als grammatikalische Konvention zu verstehen und schließt alle Geschlechter gleichermaßen ein.
  ]
})

// Affirmation
#let mkaffirmation(
  // signature of the author
  signature: none,
  // date when the paper is handed in
  date: none,
) = _empty-page(context {
  let config = _config.get()
  let rule = line(length: 100%, stroke: 0.5pt)
  _notice-heading[Eidesstattliche Erklärung]
  [
    Ich erkläre an Eides statt,
    dass ich die vorliegende Arbeit selbständig und nur unter Verwendung der angegebenen Quellen und Hilfsmittel angefertigt habe.
    Die aus fremden Quellen direkt oder indirekt übernommenen Stellen sind als solche kenntlich gemacht.
    Bestandteile der Arbeit, die mittels Künstlicher Intelligenz entstanden sind, wurden ausdrücklich gekennzeichnet.
    Die Zustimmung des/der beteiligten Unternehmen/s zur Verwendung betrieblicher Unterlagen habe ich eingeholt.
    Die Arbeit wurde bisher in gleicher oder ähnlicher Form weder veröffentlicht noch einer anderen Prüfungsbehörde/-stelle vorgelegt.
  ]
  v(3em)
  set par(justify: false)
  grid(
    columns: (40%, 1fr, 40%),
    align: left + bottom,
    row-gutter: 5pt,
    inset: (x: 3pt),
    [#config.last, #config.first], [], [],
    grid.cell(inset: 0pt, rule), [], [],
    [Name, Vorname Verfassender], [], [],
    grid.cell(colspan: 3, v(2em)),
    [#config.location, #format-date(date)], [], align(center, _as-image(signature, width: 70%)),
    grid.cell(inset: 0pt, rule), [], grid.cell(inset: 0pt, rule),
    [Ort, Datum Abgabetermin], [], [Unterschrift Verfassender],
  )
})

// ---------------------------------------------------------------------------
// Abbreviations and glossary
// ---------------------------------------------------------------------------

// defines an abbreviation, which can be referred to with `gls(key)`
#let newacronym(key, short, long) = _acronyms.update(entries => {
  entries.insert(key, (short: short, long: long))
  entries
})

// defines an entry of the glossary, which can be referred to with `gls(key)`
#let newglossaryentry(key, name: none, description: none) = _glossary.update(entries => {
  entries.insert(key, (name: name, description: description))
  entries
})

// refers to an abbreviation or an entry of the glossary
// the first occurrence of an abbreviation provides the full term
#let gls(key) = context {
  // the final values allow to define entries anywhere in the document
  let acronyms = _acronyms.final()
  let glossary = _glossary.final()
  let body = if key in acronyms {
    let entry = acronyms.at(key)
    if key in _gls-used.get() { entry.short } else [#entry.long (#entry.short)]
  } else if key in glossary {
    glossary.at(key).name
  } else {
    text(fill: red)[?#key?]
  }
  _gls-used.update(used => {
    used.insert(key, true)
    used
  })
  // link to the entry in the list of abbreviations or glossary, if it gets printed
  let target = label("dhsn-gls:" + key)
  if query(target).len() > 0 { link(target, body) } else { body }
}

// helper to print a list of used entries, sorted by their name
// entries is an array of (key, name, description)
#let _print-gls(title, entries) = {
  if entries.len() > 0 {
    _list-heading(title)
    set par(leading: _single-leading, justify: false)
    grid(
      columns: (auto, 1fr),
      column-gutter: 1.5em,
      row-gutter: 1em,
      ..entries
        .sorted(key: e => lower(e.at(0)))
        .map(e => ([#strong(e.at(1))#label("dhsn-gls:" + e.at(0))], e.at(2)))
        .flatten()
    )
    pagebreak(weak: true)
  }
}

// prints the list of abbreviations, contains only abbreviations referred to with `gls`
#let printacronyms(title: "Abkürzungsverzeichnis") = context {
  let used = _gls-used.final()
  _print-gls(
    title,
    _acronyms.final().pairs().filter(e => e.at(0) in used).map(e => (e.at(0), e.at(1).short, e.at(1).long)),
  )
}

// prints the glossary, contains only entries referred to with `gls`
#let printglossary(title: "Glossar") = context {
  let used = _gls-used.final()
  _print-gls(
    title,
    _glossary.final().pairs().filter(e => e.at(0) in used).map(e => (e.at(0), e.at(1).name, e.at(1).description)),
  )
}

// ---------------------------------------------------------------------------
// Frontmatter
// ---------------------------------------------------------------------------

// helper to print a list of figures of the given kind, if there are any
#let _listof(title, kind) = context {
  if query(figure.where(kind: kind)).len() > 0 {
    _list-heading(title)
    outline(title: none, target: figure.where(kind: kind))
    pagebreak(weak: true)
  }
}

// Frontmatter
// prints ToC, LoF, LoT and LoC and swaps to arabic pagenumbering afterwards
// the argument defines how to print the list of abbreviations, e.g. `printacronyms()`
#let mkfrontmatter(abbreviations) = {
  pagebreak(weak: true)
  _list-heading[Inhaltsverzeichnis]
  outline(title: none)
  pagebreak(weak: true)
  _listof([Abbildungsverzeichnis], image)
  abbreviations
  pagebreak(weak: true)
  _listof([Tabellenverzeichnis], table)
  _listof([Quelltextverzeichnis], raw)
  counter(page).update(1)
  _page-numbering.update("1")
}

// ---------------------------------------------------------------------------
// Environments
// ---------------------------------------------------------------------------

// helper shared by dhsnfigure, dhsntable and dhsncode
// creates a figure with a source reference in its caption, in the appendix the
// figure is added to the list of appendix entries instead of the LoF, LoT or LoC
#let _env(kind, supplement, title, source, label, placement, body) = context {
  let in-appx = _in-appx.get()
  // the lists show only the title, similar to \caption[title]{title (Quelle: ...)}
  let caption = context if _in-outline.get() { title } else { env-caption(title, source: source) }
  let fig = figure(
    body,
    kind: if in-appx { _appx-kind } else { kind },
    supplement: if in-appx [Anhang] else { supplement },
    caption: figure.caption(position: bottom, caption),
    placement: placement,
  )
  // the label defaults to the title
  let name = if label != none {
    label
  } else if type(title) == str {
    title
  } else if type(title) == content and title.has("text") {
    // a title consisting of plain text only, e.g. [My figure]
    title.text
  }
  if type(name) == str {
    name = std.label(name)
  }
  [#fig#name]
}

// #dhsnfigure(source: SOURCE, placement: auto, label: "LABEL")[title][content]
// dhsnfigure puts a frame around its content and adds a source reference below the figure
// also adds a label which equals the given title
#let dhsnfigure(source: none, label: none, placement: none, title, body) = _env(
  image,
  [Abbildung],
  title,
  source,
  label,
  placement,
  block(width: 100%, stroke: 0.4pt, inset: 3pt, align(center, body)),
)

// #dhsntable(source: SOURCE, placement: auto, label: "LABEL")[title][content]
// dhsntable centers the content and adds a source reference below the table
// also adds a label which equals the given title
#let dhsntable(source: none, label: none, placement: none, title, body) = _env(
  table,
  [Tabelle],
  title,
  source,
  label,
  placement,
  align(center, body),
)

// #dhsncode(source: SOURCE, label: "LABEL")[title][content]
// dhsncode adds a source reference below the code / content
// also adds a label which equals the given title
#let dhsncode(source: none, label: none, title, body) = _env(
  raw,
  [Quelltext],
  title,
  source,
  label,
  none,
  align(left, body),
)

// adds an entry to the list of appendix entries without printing anything
#let addtoappx(title) = {
  show figure: none
  figure(none, kind: _appx-kind, supplement: [Anhang], caption: title)
}

// the number/index of the last appendix entry
#let theappx() = context counter(figure.where(kind: _appx-kind)).display()

// Appendix environment
#let dhsnappx(body) = {
  pagebreak(weak: true)
  _list-heading[Anhangverzeichnis]
  outline(title: none, target: figure.where(kind: _appx-kind))
  pagebreak(weak: true)
  _list-heading[Anhang]
  _in-appx.update(true)
  show figure.where(kind: _appx-kind): set figure.caption(position: bottom)
  show figure.where(kind: _appx-kind): it => {
    show figure.caption: set text(size: _sizes.small)
    it
  }
  body
  pagebreak(weak: true)
  _in-appx.update(false)
}

// ---------------------------------------------------------------------------
// Citations
// ---------------------------------------------------------------------------

// helper to accept citekeys as label or string
#let _as-label(key) = if type(key) == str { label(key) } else { key }

// helper to create a citation, which is not moved into a footnote on its own
#let _cite(key, pages, ..args) = {
  let supplement = pages.pos().at(0, default: none)
  if supplement != none {
    supplement = [#supplement]
  }
  [#cite(_as-label(key), supplement: supplement, ..args)<dhsn-cite>]
}

// direct citation, creates a footnote like "Author (Year), S. 17."
// the optional second argument describes the pages, `@key[17]` does the same
#let dhsncite(key, ..pages) = footnote(_cite(key, pages))

// indirect citation, creates a footnote like "Vgl. Author (Year), S. 17."
#let vglcite(key, ..pages) = footnote[Vgl. #_cite(key, pages)]

// citation without a footnote, to be used in the source of figures, tables and codes
#let captioncite(key, ..pages) = _cite(key, pages, style: "dhsn-intext.csl")

// ---------------------------------------------------------------------------
// Simple mode
// ---------------------------------------------------------------------------

// Configures everything, so you do not have to worry about anything
// Use it with `#show: dhsnsimple.with(...)`
#let dhsnsimple(
  // first name of the author
  first: none,
  // last name of the author
  last: none,
  // company the author works at
  company: none,
  // location of the university
  location: none,
  // if true links will be colored
  linkcoloring: false,
  // if false the title will not be shown in the header
  header: true,
  // if specified the header shows this text instead of the title
  headertitle: none,
  // theme of code blocks, "github-light", "github-dark" or none
  codetheme: "github-light",
  // image, placed in the top right corner of the title page
  img: none,
  // course attended at the university
  course: none,
  // title of the paper
  title: none,
  // number of the author
  number: none,
  // correctors, an array or a comma separated string
  corrector: (),
  // date when the theme of the paper was announced
  themedate: none,
  // date when the paper has been handed in
  returndate: none,
  // signature of the author
  signature: none,
  // where the company is located at
  companylocation: none,
  // type of the paper (thesis etc...)
  type: none,
  // if type thesis select bachelor degree type
  degreetype: "Science",
  // thesis assignment, e.g. `image("assignment.pdf")`
  assignment: none,
  // whether to include the blocknotice or not
  blocknotice: true,
  // whether to include the artificial intelligence usage notice or not
  ainotice: false,
  // artificial intelligence models used
  aimodel: (),
  // whether to include the gender notice or not
  gendernotice: false,
  // content of the abstract
  abstract: none,
  // whether the abstract is added to the table of contents
  abstractintoc: false,
  // abbreviations, a dictionary mapping the short form to the long form
  // or the key to a dictionary with the entries `short` and `long`
  acronyms: (:),
  // glossary, a dictionary mapping the key to a dictionary with the entries `name` and `description`
  glossary: (:),
  // the bibliography, e.g. `bibliography("document.bib")`
  bibliography: none,
  body,
) = {
  set document(title: title, author: first + " " + last) if (
    std.type(title) == str and std.type(first) == str and std.type(last) == str
  )
  show: dhsnarticle.with(
    first: first,
    last: last,
    company: company,
    location: location,
    linkcoloring: linkcoloring,
    header: header,
    headertitle: headertitle,
    codetheme: codetheme,
  )
  for (key, value) in acronyms {
    if std.type(value) == dictionary {
      newacronym(key, value.at("short", default: key), value.long)
    } else {
      newacronym(key, key, value)
    }
  }
  for (key, value) in glossary {
    newglossaryentry(key, name: value.name, description: value.description)
  }
  mktitle(
    title: title,
    img: img,
    course: course,
    number: number,
    corrector: corrector,
    themedate: themedate,
    returndate: returndate,
    type: type,
    degreetype: degreetype,
  )
  if assignment != none {
    page(header: none, footer: none, margin: 0pt, _as-image(assignment, width: 100%, height: 100%, fit: "contain"))
  }
  if blocknotice {
    mkblocknotice(signature: signature, date: returndate, location: companylocation)
  }
  if ainotice {
    mkainotice(model: aimodel)
  }
  if gendernotice {
    mkgendernotice()
  }
  if abstract != none {
    heading(numbering: none, outlined: abstractintoc)[Abstract]
    abstract
    pagebreak(weak: true)
  }
  mkfrontmatter({
    printacronyms()
    printglossary()
  })
  body
  if bibliography != none {
    pagebreak(weak: true)
    bibliography
  }
  mkaffirmation(signature: signature, date: returndate)
}
