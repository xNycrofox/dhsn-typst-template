#!/bin/sh
# Compiles the examples of the template and creates the previews shown in the documentation
# The results are written to docs/public/examples
set -eu

cd "$(dirname "$0")/../.."
out=docs/public/examples
# pages of the examples, removed afterwards
tmp=$out/.pages
mkdir -p "$out"

for name in simple minimal cookbook; do
    typst compile --root . "examples/$name.typ" "$out/$name.pdf"
    mkdir -p "$tmp/$name"
    typst compile --root . --ppi 60 "examples/$name.typ" "$tmp/$name/{0p}.png"
    count=$(ls "$tmp/$name" | wc -l | tr -d ' ')
    typst compile --root . --ppi 110 --input "dir=/$tmp/$name" --input "n=$count" docs/scripts/preview.typ "$out/$name.png"
done
typst compile --root . --ppi 90 --pages 1 examples/simple.typ "$out/title.png"

rm -rf "$tmp"
