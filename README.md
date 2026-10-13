# A Typst template for DHSN Dresden

This repository contains a [Typst](https://typst.app) template, which tries to follow the [DHSN Dresden Styleguide](https://www.ba-dresden.de/fileadmin/M3__BA_Dresden/downloads/zentrale-dokumente/Leitfaden_wissentschaftliche_Arbeiten.pdf) as close as possible.
It is the Typst counterpart of the [DHSN Dresden LaTeX template](https://github.com/ba-dresden/ba-latex-template).
**The template might do things wrong and there is no warranty. It is your own responsibility to check for correctness.**

![Pages of the example document](docs/assets/examples/simple.png)

## Usage

```typst
#import "@local/baarticle:0.1.0": *

#show: basimple.with(
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
)

= Caption
Here is the content of paper.
```

## Enduser Documentation

[Go here please](https://xnycrofox.github.io/dhsn-typst-template/). :rocket: This README provides a development overview.

## Files

The source files are commented rather extensively.

- `lib.typ` contains the template and provides everything related to styling and spacing. Also defines the functions for the title page, notices, frontmatter, abbreviations, citations and environments.
- `dhsn.csl` describes the citation style and the formatting of bibliography entries.
- `dhsn-intext.csl` is a variant of `dhsn.csl` used by `captioncite`.
- `themes/` contains the `github-light` and `github-dark` themes used to highlight code.
- `typst.toml` is the package manifest.
- `template/` contains the starting point created by `typst init`.
- `minimal.typ`, `simple.typ` and `cookbook.typ` are example documents, `examples/` contains files they include.
- `docs/` contains the documentation, `docs/assets/examples/` the compiled examples shown there.

Modifications to the template can be tested by compiling the `minimal.typ`, `simple.typ` and `cookbook.typ` files.
Some sort of unit tests are provided by the `test.typ` file. Its compilation fails if an assertion does not hold.

```sh
typst compile minimal.typ
typst compile simple.typ
typst compile test.typ
```

A GitHub Actions workflow compiles all of them on every push.

The documentation is build from the `docs` folder and served via GitHub Pages.

## Formatting

To ensure consistent formatting use the [`.editorconfig`](./.editorconfig) and [`.prettierrc`](./.prettierrc) files.

The following file types are formatted using Prettier:

- Markdown
- YAML
- Ruby
- HTML

All Typst related files are formatted using [`typstyle`](https://github.com/typstyle-rs/typstyle).

The following vs code extensions are helpful to format the files:

- [EditorConfig](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
- [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist)

Originally crafted by [Nuckal777](https://github.com/Nuckal777).
