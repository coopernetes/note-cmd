#!/usr/bin/env bash

# This is not portable to MacOS
function new-note {
  _dir="$(date +%Y%m%d)"
  _name="$(date +%H%M%S)"
  if ! [ -z "$1" ]; then
    _name="$1"
  fi
  if ! [ -z "$GHREPOS" ]; then
    mkdir -p $GHREPOS/notes/$_dir
  else
    echo "GHREPOS unset, bailing."
    exit 1
  fi
  echo "# ${_name}" > "$GHREPOS/notes/$_dir/$_name.md"
  echo >> "$GHREPOS/notes/$_dir/$_name.md"
  vim +2 "$GHREPOS/notes/$_dir/$_name.md"
}

