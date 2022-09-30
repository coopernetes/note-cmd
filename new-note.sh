#!/usr/bin/env bash
set -eux
set -o pipefail

_dir="$(date +%Y%m%d%H%M%S)"
_title="$@"
_tmpf=$(mktemp)
trap "rm -f $GHREPOS/notes/$_dir/README.md $_tmpf;rmdir $GHREPOS/notes/$_dir" SIGINT SIGTERM
mkdir $GHREPOS/notes/$_dir

echo "# ${_title}" > $_tmpf
echo >> $_tmpf
vim +2 $_tmpf
#echo "# ${_title}" > "$GHREPOS/notes/$_dir/README.md"
#echo >> "$GHREPOS/notes/$_dir/README.md"
#vim +2 "$GHREPOS/notes/$_dir/README.md"
if [ $? -ne 0 ]; then
  echo "Not cleanly exited, bailing..."
  exit 1
fi
if [ -z "$(cat $_tmpf)" ]; then
  echo "File is empty! Exiting..."
  exit 1
fi
cd "$GHREPOS/notes"
mv $_tmpf "$GHREPOS/notes/$_dir/README.md"
git add "$_dir/"
echo "would have committed: $(git status)"
git restore --staged $_dir
# git commit -m "${_title}"
# git push origin main
cd -

