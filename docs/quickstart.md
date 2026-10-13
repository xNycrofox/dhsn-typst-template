---
title: Quick Start
---

# Quick Start

This quick start will outline a simple way to get started with this template and Typst.
For the most steps described below exist alternative solution.
You can check the other articles in this documentation for the alternatives.

## Install Typst

Install the [Typst compiler](https://github.com/typst/typst#installation), e.g. with `winget install --id Typst.Typst` on Windows or `brew install typst` on macOS.
Nothing else is required. Typst is a single program, which already bundles the fonts the template needs.

## Download the template

Typst looks up local packages in a certain directory of your user account.
Clone the template into that directory under the name `dhsnarticle/0.1.0`.

Windows (PowerShell):

```sh
git clone https://github.com/xNycrofox/dhsn-typst-template "$env:APPDATA\typst\packages\local\dhsnarticle\0.1.0"
```

macOS:

```sh
git clone https://github.com/xNycrofox/dhsn-typst-template "$HOME/Library/Application Support/typst/packages/local/dhsnarticle/0.1.0"
```

Linux:

```sh
git clone https://github.com/xNycrofox/dhsn-typst-template "$HOME/.local/share/typst/packages/local/dhsnarticle/0.1.0"
```

::: info
Without git download the [ZIP file](https://github.com/xNycrofox/dhsn-typst-template/archive/refs/heads/main.zip) of the template and extract its content into that directory, so that `dhsnarticle/0.1.0/typst.toml` exists.
:::

Afterwards create a directory, which will hold all the files required for your paper, by executing `typst init @local/dhsnarticle:0.1.0 somedirectory`.
The directory structure should now look like the following.

```text
somedirectory
|-document.bib
|-document.typ
|-images|-logo.png
|-images|-signature.png
```

## Get the required images

You need an image of your signature.
Put it into the subfolder 'images' and call it `signature.png`.

::: info
If the image of your signature as an other file extension than png, use that one.
:::

## Build your first paper

Open the document.typ file in your favourite editor. It contains something similar to the following code block.

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

The only task left is to compile the document.
Open a command line in the working directory and execute `typst compile document.typ`.
After running that command `document.pdf` is created. No other files are created.
You can view the PDF-file in your favourite viewer.
The first pages of the result look like this:

![Title page](/examples/title.png)

Now you probably want inform yourself about the [Typst basics](./usage/basics) and the [simple mode](./usage/simple).
Complete documents to copy from are shown in the [examples](./examples/).

::: tip
`typst watch document.typ` recompiles the document whenever a file changes. Some PDF-viewers, like Adobe Reader, hold file locks. You need to close these before compiling. Otherwise compilation will fail.
:::
