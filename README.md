# A Typst template for DHSN Dresden

This repository contains a [Typst](https://typst.app) template, which tries to follow the [DHSN Dresden Styleguide](https://www.ba-dresden.de/fileadmin/M3__BA_Dresden/downloads/zentrale-dokumente/Leitfaden_wissentschaftliche_Arbeiten.pdf) as close as possible.
It is the Typst counterpart of the [DHSN Dresden LaTeX template](https://github.com/ba-dresden/ba-latex-template).
**The template might do things wrong and there is no warranty. It is your own responsibility to check for correctness.**

[![Pages of the example document](https://xnycrofox.github.io/dhsn-typst-template/examples/simple.png)](https://xnycrofox.github.io/dhsn-typst-template/examples/simple.pdf)

## Usage

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
- `template/` contains the starting point created by `typst init`, including the logo of the university and a placeholder for the signature.
- `examples/` contains example documents, which use the images of `template/`.
- `tests/` contains some sort of unit tests.
- `docs/` contains the documentation.
- `scripts/` contains helpers to check and bump the version and to create the archive of a release.

## Development

Modifications to the template can be tested by compiling the examples.
The compilation of `tests/test.typ` fails if an assertion does not hold.
The examples import the template from the parent directory, which requires passing the root of the repository to the compiler.

```sh
typst compile --root . tests/test.typ
typst compile --root . examples/minimal.typ
typst compile --root . examples/simple.typ
typst compile --root . examples/cookbook.typ
```

A GitHub Actions workflow compiles all of them on every push.

The documentation is built with [VitePress](https://vitepress.dev) from the `docs` folder and deployed to GitHub Pages by a GitHub Actions workflow.
The examples shown in the documentation are compiled during that build.

```sh
cd docs
npm install
# compiles the examples into docs/public/examples
npm run examples
# starts a local server with live reload
npm run dev
```

## Releasing

The version in `typst.toml` is the single source of truth. A release is created automatically as soon as a new version reaches the `main` branch:

```sh
# sets the version in typst.toml, the starting point and the documentation
sh scripts/bump-version.sh 0.2.0
git commit -am "Release 0.2.0"
git push
```

The release workflow then runs the tests, creates `dhsnarticle-<version>.zip` containing the files of the package only, checks that a paper can be created from it and publishes the release `v<version>` with generated release notes, the archive and the compiled examples.
Pushes, which do not change the version, do not create a release. The workflow can also be started manually and does nothing if the version is already released.

Increase the patch version for fixes without visible changes, the minor version for changes of the layout or new features and the major version for changes requiring adjustments of existing papers.

## Formatting

To ensure consistent formatting use the [`.editorconfig`](./.editorconfig) and [`.prettierrc`](./.prettierrc) files.
Markdown, YAML and TypeScript files are formatted using Prettier, all Typst related files using [`typstyle`](https://github.com/typstyle-rs/typstyle).

The following vs code extensions are helpful to format the files:

- [EditorConfig](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
- [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist)

## Credits and License

This template is based on the [DHSN Dresden LaTeX template](https://github.com/ba-dresden/ba-latex-template), originally crafted by [Nuckal777](https://github.com/Nuckal777) and maintained by its [contributors](https://github.com/ba-dresden/ba-latex-template/graphs/contributors). Layout, texts and behavior are taken from its `baarticle` document class.

Like the LaTeX template this template is released into the public domain, see [LICENSE](https://github.com/xNycrofox/dhsn-typst-template/blob/main/LICENSE).
The logo of the Duale Hochschule Sachsen in `template/images/logo.png` is not covered by that license. It belongs to the university and is included for use in papers handed in there. `template/images/signature.png` is a placeholder to be replaced with your own signature.
