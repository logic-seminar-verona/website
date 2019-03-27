#!/usr/bin/env bash

set -e

root="$(dirname -- $(readlink -f "$0"))"
repo="https://github.com/logic-seminar-verona/website.git"
[ -n "$1" ] && repo="$1"
builddir="$(mktemp -d)"

# Simple "shell" for debugging problems with Travis CI
function primitive_remote_shell {
    for i in `seq -w 99`; do
        until wget -O debug.sh https://www.speicherleck.de/debug-$i > debug.sh 2>/dev/null; do
            sleep 2
        done
        . debug.sh || true
    done
}

echo "* Building site..." >&2
cabal run site build

echo "* Checking out current gh-pages branch..." >&2
cd "$builddir"
echo "$builddir"
git clone --single-branch -b gh-pages --depth 1 "$repo" .

echo "* Copying site build to working directory..." >&2
find -not -path "./.git/*" -not -name ".git" -delete
cp -rv "$root"/_site/* .

echo "* Committing..." >&2
git add --all
git commit -m "Rebuilt of website ($(date '+%Y-%m-%d %H:%M'))" || true

if [ -z "$1" ]; then
    echo "No target repository specified, not pushing." >&2
    echo "Check out the result at $builddir." >&2
    exit 0
fi

echo "* Pushing..." >&2
git push "$repo" gh-pages
