# Examples

Complete documents, which can be used as a starting point. All of them are part of the [repository](https://github.com/xNycrofox/dhsn-typst-template) and compiled with the current version of the template.

| Document                              | Result                                 | Description                                                                   |
| ------------------------------------- | -------------------------------------- | ----------------------------------------------------------------------------- |
| [simple.typ](https://github.com/xNycrofox/dhsn-typst-template/blob/main/examples/simple.typ)     | [PDF](https://xnycrofox.github.io/dhsn-typst-template/examples/simple.pdf)   | simple mode with abbreviations, glossary, abstract, tables, code and appendix |
| [minimal.typ](https://github.com/xNycrofox/dhsn-typst-template/blob/main/examples/minimal.typ)   | [PDF](https://xnycrofox.github.io/dhsn-typst-template/examples/minimal.pdf)  | normal mode with citations and bibliography                                   |
| [cookbook.typ](https://github.com/xNycrofox/dhsn-typst-template/blob/main/examples/cookbook.typ) | [PDF](https://xnycrofox.github.io/dhsn-typst-template/examples/cookbook.pdf) | snippets for common tasks, see [cookbook](./cookbook)                         |


- [Bachelor Thesis](./thesis) shows a thesis split into multiple files.
- [Report](./report) shows smaller papers.
- [Cookbook](./cookbook) collects snippets for common tasks.

::: info
The examples in the repository import the template with `#import "../lib.typ": *` and are compiled with `typst compile --root . examples/simple.typ` in the directory of the template. Your own paper imports `@local/dhsnarticle:0.1.0` instead.
:::
