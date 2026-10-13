---
title: Normal Mode
sort: 3
---

# Normal mode

Not using the "simple mode" makes the usage of the template a bit more verbose, but provides a lot more flexibility.
Usually "normal mode" is only necessary if somebody has special requirements, which deviate from the styleguide, e.g. another order of the elements.

Let's start with the basic document structure.
The `baarticle` function sets up the page, fonts, spacing and the citation style called "dhsn", which should be used to get the citations and bibliography right.
Its options are described in the "simple mode" [section](./simple).

```typst
#import "@local/baarticle:0.1.0": *

#show: baarticle.with(first: "firstname", last: "lastname", company: "comp", location: "Dresden")
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

It should be obvious that it is possible to move different elements from the beginning and end of a paper around. Let's discuss the functions quickly:

- `mktitle` creates a title page
  - `title` should be the title of the paper
  - `img` should be the logo of the university
  - `course` should be your course of studies
  - `number` should be your matriculation number
  - `corrector` should be an array or a comma separated list of correctors
  - `themedate` should be the date when the theme of the paper was announced
  - `returndate` should be the date when the paper is handed in
  - `type` defines the type of the paper. It should be one of `"thesis"`, `"master-thesis"`, `"study"` or `"report"`. Any other value is used as custom title. Setting the `type` parameter is required.
  - `degreetype` defines the degree type, it defaults to `"Science"`
- `mkblocknotice` creates a block notice
  - `signature` should be an image of your signature
  - `date` should be the date when the paper is handed in
  - `location` should be the location of your company
- `mkgendernotice` creates a notice about gender usage in the text
- `mkfrontmatter` creates the table of contents, list of figures, abbreviations, tables and codes and swaps to arabic page numbering afterwards
  - list of figures, tables and codes are only created if they have an entry
  - the first and only argument describes how to create the list of abbreviations. Pass `[]` if there is none.
  - instead of using `mkfrontmatter` you can build the whole frontmatter yourself using standard Typst functions like `outline`
- `mkainotice` creates a notice due to the usage of generative artificial intelligence
  - `model` should be an array or a comma separated list of artificial intelligence models used
- `mkaffirmation` creates the affirmation
  - `signature` should be an image of your signature
  - `date` should be the date when the paper is handed in

```note
 The title page, the notices and the affirmation are always placed on a page of their own without header and page number. The header shows the title given to `mktitle`.
```

## Using the abbreviations and the glossary of the template

If you decide to use the abbreviations of the template, define them with `newacronym` and `newglossaryentry` and print the lists with `printacronyms` and `printglossary` as outlined below.
Both lists are only created if they have an entry, which is referred to with `gls`.

```typst
#import "@local/baarticle:0.1.0": *

#show: baarticle.with(first: "firstname", last: "lastname", company: "comp", location: "Dresden")

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

Other packages dealing with abbreviations, like [glossarium](https://typst.app/universe/package/glossarium), can be used as well. Print their list in the argument of `mkfrontmatter`.
