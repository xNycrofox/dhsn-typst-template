#!/bin/sh
# Creates dist/dhsnarticle-<version>.zip containing the files of the package only
# The archive is meant to be extracted into the directory for local Typst packages
set -eu

cd "$(dirname "$0")/.."
version=$(sh scripts/check-version.sh)
target=dist/dhsnarticle/$version

rm -rf dist
mkdir -p "$target"
cp -R lib.typ dhsn.csl dhsn-intext.csl themes template typst.toml README.md LICENSE "$target"
(cd dist && zip -qr "dhsnarticle-$version.zip" dhsnarticle)
rm -rf dist/dhsnarticle
echo "dist/dhsnarticle-$version.zip"
