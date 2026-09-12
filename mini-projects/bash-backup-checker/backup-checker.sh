#!/usr/bin/env bash

set -euo pipefail

folders=("$HOME/Documents" "$HOME/Pictures" "$HOME/Desktop")
missing=0

echo "Backup folder check"
echo "==================="

for folder in "${folders[@]}"; do
  if [[ -d "$folder" ]]; then
    count=$(find "$folder" -maxdepth 1 -type f | wc -l | tr -d ' ')
    echo "OK: $folder contains $count files at top level."
  else
    echo "Missing: $folder"
    missing=$((missing + 1))
  fi
done

if [[ "$missing" -gt 0 ]]; then
  echo "$missing folder(s) need attention."
  exit 1
fi

echo "All important folders exist."
