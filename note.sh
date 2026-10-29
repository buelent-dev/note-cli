#!/bin/bash
DB=".notes/db"
case "$1" in
  add)
    hash=$(printf '%s' "$2" | shasum -a 256 | cut -d' ' -f1)
    printf '%s' "$2" > "$DB/$hash"
    echo "Gespeichert: $hash"
    ;;
    
      list)
    for f in "$DB"/*; do
      [ -f "$f" ] && echo "$(basename "$f"): $(cat "$f")"
    done
    ;;
esac