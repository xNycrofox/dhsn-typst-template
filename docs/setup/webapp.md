---
title: Typst Web App
---

# Typst Web App

The [Typst web app](https://typst.app) is an online-editor with a live preview, comparable to Overleaf. Nothing has to be installed.

::: warning
The files are stored on servers of a third party. Take care regarding confidential topics, especially if your paper has a block notice.
:::

## Setting up a project

1. Create an account and an empty project.
2. Download the [ZIP file](https://github.com/xNycrofox/dhsn-typst-template/archive/refs/heads/main.zip) of the template and extract it.
3. Upload `lib.typ`, `dhsn.csl`, `dhsn-intext.csl` and the directory `themes` to the project, keeping the directory structure.
4. Upload the logo `template/images/logo.png` as `images/logo.png`.
5. Upload an image of your signature as `images/signature.png`.
6. Put the following into the main file and adjust it.

```typst
#import "lib.typ": *

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

The preview on the right side shows the paper. The PDF file can be downloaded with the button in the top right corner.

::: info
Local packages like `@local/dhsnarticle:0.1.0` are not available in the web app. That is why the template is imported with `#import "lib.typ": *` there.
:::
