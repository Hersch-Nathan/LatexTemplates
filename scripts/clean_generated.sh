#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$repo_root"

# Generated LaTeX artifact extensions to remove (PDFs intentionally excluded).
exts=(
  "*.aux"
  "*.bbl"
  "*.bcf"
  "*.blg"
  "*.fdb_latexmk"
  "*.fls"
  "*.log"
  "*.lof"
  "*.lot"
  "*.out"
  "*.run.xml"
  "*.synctex.gz"
  "*.synctex"
  "*.toc"
  "*.nav"
  "*.snm"
  "*.vrb"
  "*.dvi"
  "*.idx"
  "*.mst"
)

removed_any=0
for pattern in "${exts[@]}"; do
  while IFS= read -r -d '' f; do
    rm -f "$f"
    removed_any=1
    printf 'removed %s\n' "${f#./}"
  done < <(find . -path './.git' -prune -o -type f -name "$pattern" -print0)
done

if [[ "$removed_any" -eq 0 ]]; then
  echo "No generated artifacts found."
else
  echo "Done cleaning generated artifacts."
fi
