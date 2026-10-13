#!/bin/sh
# Checks that the version of typst.toml is used everywhere the package is imported or installed
# Prints the version if everything matches
set -eu

cd "$(dirname "$0")/.."
version=$(sed -n 's/^version = "\(.*\)"$/\1/p' typst.toml)
# imports like @local/dhsnarticle:0.1.0, paths like dhsnarticle/0.1.0 or dhsnarticle\0.1.0,
# archives like dhsnarticle-0.1.0.zip and tags like download/v0.1.0
others=$(grep -rhoE '(dhsnarticle[:/\\-]|download/v)[0-9]+\.[0-9]+\.[0-9]+' README.md docs template --include='*.md' --include='*.typ' \
    | sed -E 's/.*[:\/\\v-]//' | sort -u | grep -vx "$version" || true)
if [ -n "$others" ]; then
    echo "typst.toml has version $version, but these versions are referred to as well:" >&2
    echo "$others" >&2
    grep -rnE '(dhsnarticle[:/\\-]|download/v)[0-9]+\.[0-9]+\.[0-9]+' README.md docs template --include='*.md' --include='*.typ' | grep -v "$version" >&2
    exit 1
fi
echo "$version"
