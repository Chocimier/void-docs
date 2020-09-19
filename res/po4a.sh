#!/bin/sh
# uses PREFIX from environment
: "${PREFIX:=/usr/local}"

set -e
PATH="$PWD/res:$PATH"
languages="es pl ru"

# Build HTML mdbook
echo "Updating translations"
printf '%s\n' "[po4a_langs] $languages" > po4a.cfg
printf '%s\n' '[po4a_paths] po/$master.pot $lang:po/$lang/$master.po' >> po4a.cfg
find src -path src/languages -prune -o -name '*.md' -print  |
while read file; do
	printf '%s\n' "[type: text] $file \$lang:languages/\$lang/$file master:file=$(echo $file | tr / -)" >> po4a.cfg
done
po4a po4a.cfg -k 0

for lang in $languages; do
	echo "Building $lang mdBook"
	path=languages/$lang
	cp book.toml $path
	cp -r src/theme $path/src
	cd $path
	mdbook build
	cd -
done
