---
title: Typst
---

# Typst Setup

::: tip
Typst provides an online-editor, the Typst web app. You can skip the whole local setup, if you choose to [use it](./webapp). Take care regarding confidential topics.
:::

## Compiler

You need to install the Typst compiler, version 0.14 or newer. It is a single executable without further dependencies.

### Windows

Run `winget install --id Typst.Typst` or download the executable from the [releases](https://github.com/typst/typst/releases) page.

### MacOS

Run `brew install typst`.

### Linux

Kindly ask your package manager.
Most linux distributions provide a `typst` package. Alternatively download the executable from the [releases](https://github.com/typst/typst/releases) page.

## Fonts

The template uses the fonts "New Computer Modern" and "DejaVu Sans Mono".
Both are embedded in the Typst compiler, so there is nothing to install.

## Editor

Next you need an editor.
There is a bunch of choices, starting from plain notepad.
The recommended setup is [VSCode](https://code.visualstudio.com/) with the [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) extension, which provides a live preview, completion and formatting.

The extension compiles the document on its own. Open the `.typ` file and click on "Preview" above the first line or execute the command "Typst Preview: Preview Opened File". The preview follows the cursor and a click into the preview jumps to the source. "Export PDF" creates the PDF file.

Other editors with Typst support through Tinymist are Neovim, Helix, Zed and Sublime Text.

## Compilation

To get a PDF file from Typst code compilation is required.
A single run of a single program is sufficient: `typst compile document.typ`.
Use `typst watch document.typ` to recompile the document automatically whenever a file changes.

::: info
The bibliography, table of contents and all lists are created within that single run. There are no auxiliary files to clean up.
:::

Useful options of the compiler:

| Command                                              | Description                                         |
| ---------------------------------------------------- | --------------------------------------------------- |
| `typst compile document.typ`                         | creates `document.pdf`                              |
| `typst compile document.typ paper.pdf`               | creates `paper.pdf`                                 |
| `typst watch document.typ`                           | recompiles whenever a file changes                  |
| `typst compile --pages 1-3 document.typ`             | exports only some pages                             |
| `typst compile --pdf-standard a-2b document.typ`     | creates a PDF/A file                                |
| `typst compile --root .. document.typ`               | allows access to files in the parent directory      |
| `typst fonts`                                        | lists the available fonts                           |
| `typst update`                                       | updates the compiler, if it was downloaded manually |
