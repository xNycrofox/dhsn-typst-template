---
title: Template
---

# Template Setup

## Local package

This is the recommended way to use the template.
Typst looks up local packages in a certain directory of your user account.
Each version of the template is published as a ZIP file on the [Releases](https://github.com/xNycrofox/dhsn-typst-template/releases) page.
Download `dhsnarticle-0.1.0.zip` and extract it into that directory, so that `local/dhsnarticle/0.1.0/typst.toml` exists.
The following commands do exactly that.

Windows (PowerShell):

```powershell
$packages = "$env:APPDATA\typst\packages\local"
New-Item -ItemType Directory -Force $packages | Out-Null
Invoke-WebRequest https://github.com/xNycrofox/dhsn-typst-template/releases/download/v0.1.0/dhsnarticle-0.1.0.zip -OutFile "$env:TEMP\dhsnarticle.zip"
Expand-Archive "$env:TEMP\dhsnarticle.zip" -DestinationPath $packages -Force
```

macOS:

```sh
mkdir -p "$HOME/Library/Application Support/typst/packages/local"
cd "$HOME/Library/Application Support/typst/packages/local"
curl -LO https://github.com/xNycrofox/dhsn-typst-template/releases/download/v0.1.0/dhsnarticle-0.1.0.zip
unzip dhsnarticle-0.1.0.zip && rm dhsnarticle-0.1.0.zip
```

Linux:

```sh
mkdir -p "$HOME/.local/share/typst/packages/local"
cd "$HOME/.local/share/typst/packages/local"
curl -LO https://github.com/xNycrofox/dhsn-typst-template/releases/download/v0.1.0/dhsnarticle-0.1.0.zip
unzip dhsnarticle-0.1.0.zip && rm dhsnarticle-0.1.0.zip
```

::: info
The directory is `%APPDATA%\typst\packages\local` on Windows, `~/Library/Application Support/typst/packages/local` on macOS and `~/.local/share/typst/packages/local` on Linux, in case you prefer to download and extract the file by hand.
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

## Git

Use git instead of a release if you want the newest state of the template between two releases or plan to contribute.
Clone the [repository](https://github.com/xNycrofox/dhsn-typst-template) into the directory for local packages under the name `dhsnarticle/0.1.0`, e.g. on macOS:

```sh
git clone https://github.com/xNycrofox/dhsn-typst-template "$HOME/Library/Application Support/typst/packages/local/dhsnarticle/0.1.0"
```

`git pull` in that directory updates the template. Keep in mind that the formatting of your paper may change with every update.

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

A new version of the template has a new number, e.g. `0.2.0`, and is published on the [Releases](https://github.com/xNycrofox/dhsn-typst-template/releases) page together with the compiled examples.
Install it the same way as the first one. It is placed next to the old version in a directory named after its number.
Your paper keeps using the version named in its import until you change `#import "@local/dhsnarticle:0.1.0": *`, so an update never changes a paper by accident.
Compile your paper after changing the version and check the result, as the formatting may have changed.

::: tip
Stick to one version while writing a thesis.
:::

# Get the required images

You need an image of your signature.
Put it in the subfolder 'images' as signature.png of your project.
The logo of the university is part of the template, see `template/images/logo.png`. `typst init` copies it into your project.

::: info
Images and the bibliography are always loaded in your own document with `image("path")` and `bibliography("path")` and passed to the template. Typst resolves paths relative to the file they are written in, so the template cannot load files of your project by their path.
:::
