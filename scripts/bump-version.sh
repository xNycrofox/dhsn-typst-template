#!/bin/sh
# Sets a new version in typst.toml and everywhere the package is imported or installed
# Usage: sh scripts/bump-version.sh 0.2.0
set -eu

cd "$(dirname "$0")/.."
new=$1
echo "$new" | grep -qE '^[0-9]+\.[0-9]+\.[0-9]+$' || { echo "expected a version like 0.2.0" >&2; exit 1; }
old=$(sed -n 's/^version = "\(.*\)"$/\1/p' typst.toml)
escaped=$(echo "$old" | sed 's/\./\\./g')

files=$(grep -rlE "(dhsnarticle[:/\\\\-]|download/v)$escaped" README.md docs template --include='*.md' --include='*.typ')
for file in typst.toml $files; do
    sed -E "s/(dhsnarticle[:\/\\\\-]|download\/v|^version = \")$escaped/\1$new/g" "$file" > "$file.tmp" && mv "$file.tmp" "$file"
done
sh scripts/check-version.sh
