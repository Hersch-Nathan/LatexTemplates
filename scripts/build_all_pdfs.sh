#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$repo_root"

if ! command -v latexmk >/dev/null 2>&1; then
  echo "Error: latexmk is required but was not found in PATH."
  exit 1
fi

tex_files=()
while IFS= read -r file; do
  tex_files+=("$file")
done < <(find . -path './.git' -prune -o -type f -name '*.tex' -print | sort)

if [[ "${#tex_files[@]}" -eq 0 ]]; then
  echo "No .tex files found."
  exit 0
fi

fail_count=0

for tex in "${tex_files[@]}"; do
  rel="${tex#./}"
  dir="$(dirname "$rel")"
  base="$(basename "$rel")"

  echo "building $rel"

  pushd "$dir" >/dev/null
  # Ensure parent classes/styles can be resolved when building from subdirectories.
  if TEXINPUTS="..:${TEXINPUTS:-}" latexmk -pdf -interaction=nonstopmode "$base"; then
    :
  else
    fail_count=$((fail_count + 1))
    echo "failed $rel"
  fi
  popd >/dev/null

done

if [[ "$fail_count" -gt 0 ]]; then
  echo "Build completed with $fail_count failure(s)."
  exit 1
fi

echo "Build completed successfully."
