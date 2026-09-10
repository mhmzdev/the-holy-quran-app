#!/usr/bin/env bash
# Builds the Flutter web app for GitHub Pages and copies it into the
# mhmzdev.github.io repo under /quran (served at https://mhmzdev.github.io/quran/).
#
# Usage: bash scripts/deploy_web.sh [path-to-mhmzdev.github.io checkout]
# Then review `git status` in that repo and push to publish.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PAGES_REPO="${1:-$ROOT/../mhmzdev.github.io}"
TARGET="$PAGES_REPO/quran"

[ -d "$PAGES_REPO/.git" ] || { echo "Pages repo not found at $PAGES_REPO" >&2; exit 1; }

cd "$ROOT"
# --base-href must match the sub-path on GitHub Pages.
# --no-tree-shake-icons: the icon subsetter aborts on one of the bundled icon fonts.
fvm flutter build web --release --base-href /quran/ --no-tree-shake-icons

rm -rf "$TARGET"
mkdir -p "$TARGET"
cp -R build/web/. "$TARGET/"

echo
echo "Copied build/web -> $TARGET"
echo "Version: $(cat build/web/version.json)"
echo "Next: cd $PAGES_REPO && git add quran && git commit -m 'quran: deploy $(grep -m1 '^version:' pubspec.yaml | cut -d' ' -f2)' && git push"
