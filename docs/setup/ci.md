---
title: Continuous Integration
sort: 4
---

# Continuous Integration

If your paper is stored in a GitHub repository, GitHub Actions can compile it on every push and provide the PDF file.
This ensures that the paper always compiles and that every version of it can be retrieved.

```warning
 Please ensure you are allowed to use GitHub and keep the repository private.
```

Add the template as a [submodule](./template) in the directory `template` or copy its files into the repository, so that the paper compiles without a local package.
Then create the file `.github/workflows/build.yml` with the following content.

```yaml
name: Build
on: push
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
        with:
          submodules: true
      - uses: typst-community/setup-typst@v4
      - run: typst compile document.typ
      - uses: actions/upload-artifact@v4
        with:
          name: document
          path: document.pdf
```

The PDF file can be downloaded from the page of the workflow run.

The [repository](https://github.com/xNycrofox/dhsn-typst-template) of the template uses the same mechanism to compile its examples and tests on every change, see `.github/workflows/test.yml`.
