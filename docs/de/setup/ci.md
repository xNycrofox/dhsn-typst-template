---
title: Continuous Integration
---

# Continuous Integration

Liegt deine Arbeit in einem GitHub-Repository, kann GitHub Actions sie bei jedem Push kompilieren und das PDF bereitstellen.
So ist sichergestellt, dass die Arbeit immer kompiliert und jeder Stand abrufbar bleibt.

::: warning
Stelle sicher, dass du GitHub verwenden darfst, und halte das Repository privat.
:::

Füge das Template als [Submodul](./template) im Verzeichnis `template` hinzu oder kopiere seine Dateien ins Repository, damit die Arbeit ohne lokales Paket kompiliert.
Lege dann die Datei `.github/workflows/build.yml` mit folgendem Inhalt an.

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

Das PDF lässt sich auf der Seite des Workflow-Laufs herunterladen.

Das [Repository](https://github.com/xNycrofox/dhsn-typst-template) des Templates nutzt denselben Mechanismus, um bei jeder Änderung Beispiele und Tests zu kompilieren und diese Dokumentation zu bauen, siehe `.github/workflows`.
