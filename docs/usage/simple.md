---
title: Simple Mode
---

# Simple mode

The template has a "simple mode", which is provided by the `dhsnsimple` function. It configures everything, so you do not have to worry about anything.
The "simple mode" is enabled with a show rule at the top of the document.

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
  assignment: image("somefile.pdf"),
)

= Caption
Here is the content of paper.
```

::: info
The template has no dependencies on other packages. Abbreviations, the glossary, citations and code highlighting are part of the template.
:::

Let's go through the general options quickly:

- `first` should be your first name
- `last` should be your last name
- `company` should be the company you work for
- `location` should be the location of university (not to be confused with `companylocation`)
- `linkcoloring` changes the text color of links, if set to `true`
- `header` removes the document title from the header, if set to `false`
- `headertitle` takes a value to overwrite the header with the new value
- `codetheme` selects the theme of code blocks, see [environments](./environments)

Let's also discuss the other options of the `dhsnsimple` function:

- `img` should be the logo of the university, e.g. `image("images/logo.png")`
- `course` should be your course of studies
- `title` should be the title of the paper
- `number` should be your matriculation number
- `corrector` should be an array or a comma separated list of correctors
- `themedate` should be the date when the theme of the paper was announced. Dates can be given as text or as `datetime`, e.g. `datetime(year: 2026, month: 3, day: 1)`. `today()` is the current date.
- `returndate` should be the date when the paper is handed in
- `signature` should be an image of your signature, e.g. `image("images/signature.png")`
- `companylocation` should be the location of your company
- `type` defines the type of the paper and influences the title page. Some preconfigured values are `"thesis"`, `"master-thesis"`, `"study"` or `"report"`. If you choose a value which is not in the list, the value itself is the new custom title which is getting displayed at the title page. Setting the `type` parameter is required.
- `degreetype` defines the degree type e. g. `"Arts"`, `"Engineering"` or `"Science"`. Setting the `degreetype` parameter is optional and only used if `type` is set to `"thesis"` or `"master-thesis"`. The default value for `degreetype` is `"Science"`.
- `assignment` should be a PDF file containing the assignment to write a thesis, e.g. `image("somefile.pdf")`. It will include the first page of the given PDF file at the appropriate place. Another page can be selected with `image("somefile.pdf", page: 2)`. Setting the `assignment` parameter is optional.
- `blocknotice` defines whether a block notice should be included or not if set to `false`. One will be included per default. Setting the `blocknotice` parameter is optional.
- `ainotice` defines whether a notice due to the usage of generative artificial intelligence should be created if set to `true` or not. Per default their will be no notice on that topic. Setting the `ainotice` parameter is optional.
- `aimodel` should be an array or a comma separated list of artificial intelligence models used. The content of this parameter is only considered if `ainotice` is set to `true`. Setting the `aimodel` parameter is optional.
- `gendernotice` defines whether a gendernotice should be included. One will be not included by default. Setting the `gendernotice` parameter is optional.
- `abstract` is the content of the abstract. Setting the `abstract` parameter is optional.
- `abstractintoc` adds the abstract to the table of contents, if set to `true`
- `acronyms` defines the abbreviations, see below
- `glossary` defines the entries of the glossary, see below
- `bibliography` should be the bibliography, e.g. `bibliography("document.bib")`, see below

To add an abstract to the paper the following should do it:

```typst
#show: dhsnsimple.with(
  ...,
  abstract: [
    content of the abstract
  ],
  // if you want to add the abstract to the table of contents
  abstractintoc: true,
)
```

The example document given can be compiled, with `typst compile file.typ` for example.

## Basic functionality

Sections can be created using `= title`, `== title` and `=== title`.
The section titles are automatically added to the table of contents.
If you do not want that use the heading function, e.g. `#heading(numbering: none, outlined: false)[title not in table of contents]`.
Footnotes can be created as usual with `#footnote[content]`.
Abbreviations are managed by the template.
To define abbreviations use the `acronyms` parameter, which maps the short form to the long form, and to refer to one use `#gls("identifier")`.
The first occurrence provides the full term. The list of abbreviations is sorted and contains only abbreviations, which are referred to.

```typst
#show: dhsnsimple.with(
  ...,
  acronyms: (
    HTTP: "Hypertext Transfer Protocol",
    // in case the identifier differs from the short form
    uc: (short: "UC", long: "Underpinning contract"),
  ),
)

= Caption
#gls("HTTP") is a protocol on the OSI-Layer 7.#footnote[Also note that...]
```

You can also define entries for a glossary with a short description of a term using the `glossary` parameter and refer to it with `#gls("identifier")`.

```typst
#show: dhsnsimple.with(
  ...,
  glossary: (
    cloud: (
      name: "Cloud Computing",
      description: [Cloud computing is the on-demand availability of computer system resources, especially data storage and computing power, without direct active management by the user.],
    ),
  ),
)

= Caption
#gls("cloud") is a term for ...
```

It is possible to refer to certain sections using `<identifier>`, which marks a certain (sub-)section, and `@identifier`, which inserts the section number.
By the way these references are also clickable links.

```typst
= Caption 1 <important>
Something important.

= Caption 2
// Would render to "As seen in Abschnitt 1."
As seen in @important.
// Would render to "As seen in section 1."
As seen in section #ref(<important>, supplement: none).
```

Images can be included with `image`, which should be wrapped in a `dhsnfigure`.
The number of a figure can be retrieved using a reference to the label provided to the function.
If no label is given the caption is used as label, which requires `#ref(label("the caption"))` if it contains spaces.
`image` has some optional arguments, e.g. for scaling images.
Take a look [here](https://typst.app/docs/reference/visualize/image/).
Tables should also be wrapped in a `dhsntable`.

```typst
#dhsnfigure(label: "myfigure")[caption][
  #image("path/to/an/image.png")
]
As seen in @myfigure ...
#dhsntable[caption][
  // The page width is 16cm
  #table(
    columns: (6cm, 8cm),
    [A], [B],
    [C], [D],
  )
]
```

An appendix can be created using the `dhsnappx` function, which will also create an overview of all appendix entries.
Most functions introduced by this template feature some customization options, which are described in the [environments](./environments) section.

```typst
// lots of content
#dhsnappx[
  #dhsnfigure[caption][
    #image("path/to/an/image.png")
  ]
]
```

It is worthwhile to split up larger documents into multiple files.
You can put each chapter into a separate `.typ` file and join them in the main file using `#include "path/to/the/file.typ"`.
Given the following file tree:

```text
somedirectory
|-chapter1.typ
|-chapter2.typ
|-chapter3.typ
|-document.typ
```

This should work.

```typst
#import "@local/dhsnarticle:0.1.0": *

#show: dhsnsimple.with(...)

#include "chapter1.typ"
#include "chapter2.typ"
#include "chapter3.typ"
```

::: info
Each chapter file, which uses functions of the template like `dhsnfigure` or `vglcite`, needs to import the template on its own.
:::

## Citations and bibliography

Sources are cited with `#vglcite(<citekey>)[pages]` and `#dhsncite(<citekey>)[pages]`, the bibliography file is passed with `bibliography: bibliography("document.bib")`.
Everything about it is described in the [citations](./citations) section.

```typst
#show: dhsnsimple.with(
  ...,
  bibliography: bibliography("document.bib"),
)

= Caption
indirect citation.#vglcite(<cloudcomp>)[17-21]
"direct citation"#dhsncite(<cloudcomp>)[29]
```
