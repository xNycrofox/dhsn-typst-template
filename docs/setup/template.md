---
title: Template
---

# Template Setup

## Local package

This is the recommended way to use the template.
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

Now the template can be imported in any document with `#import "@local/dhsnarticle:0.1.0": *`.
A directory, where you will write your paper, can be created with `typst init @local/dhsnarticle:0.1.0 somedirectory`.
The directory structure should look like this:

```text
somedirectory
|-document.bib
|-document.typ
|-images|-logo.png
|-images|-signature.png
```

Done! (Still you have to get the required images as described below.)

## Download

Alternatively copy the template next to your paper.
Create a directory, where you will write your paper, and put the files `lib.typ`, `dhsn.csl`, `dhsn-intext.csl` and the `themes` directory into it.
Create a file with the `.typ` extension, e.g. `document.typ`, and import the template with `#import "lib.typ": *`.
The directory structure should look like this:

```text
somedirectory
|-dhsn-intext.csl
|-dhsn.csl
|-document.typ
|-lib.typ
|-themes|-github-dark.tmTheme
|-themes|-github-light.tmTheme
```

## GitHub Template

::: warning
Please ensure you are allowed to use GitHub.
:::

Go to the templates [repository](https://github.com/xNycrofox/dhsn-typst-template) and click the green "Use this template" button.
Follow the instructions.
Afterwards clone your repository and create a file with the `.typ` extension, e.g. `document.typ`.
The directory structure should similar to the one described in the Download section.

## Git Submodule

Read about [submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules).
Create an empty repository and add [this](https://github.com/xNycrofox/dhsn-typst-template) one as a submodule, e.g. in the directory `template`.
Create a document.typ in the main repository and import the template with `#import "template/lib.typ": *`.
This approach allows you to always use the newest version of the template by executing `git pull` in the submodule's directory.
You can receive notifications when the template's repository is updated by clicking on the "Watch" button.

## Typst web app

Upload the files listed in the Download section to your project in the [Typst web app](https://typst.app) and import the template with `#import "lib.typ": *`.

## Updating the template

Execute `git pull` in the directory of the template to get the newest version.
Compile your paper afterwards and check the result, as the formatting may have changed.

# Get the required images

You need an image of your signature.
Put it in the subfolder 'images' as signature.png of your project.
The logo of the university is part of the template, see `template/images/logo.png`. `typst init` copies it into your project.

::: info
Images and the bibliography are always loaded in your own document with `image("path")` and `bibliography("path")` and passed to the template. Typst resolves paths relative to the file they are written in, so the template cannot load files of your project by their path.
:::
