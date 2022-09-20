#!/usr/bin/env bash

# This is not portable to MacOS
function new-note {
  _dir="$(date +%Y%m%d%H%M%S)"
  _title="$@"
  if ! [[ -z "$GHREPOS" ]]; then
    mkdir -p $GHREPOS/notes/$_dir
  else
    echo "GHREPOS unset, bailing."
    exit 1
  fi
  echo "# ${_title}" > "$GHREPOS/notes/$_dir/README.md"
  echo >> "$GHREPOS/notes/$_dir/README.md"
  vim +2 "$GHREPOS/notes/$_dir/README.md"
  cd "$GHREPOS/notes"
  git add "$_dir/"
  git commit -m "${_title}"
  git push origin main
  cd -
}

