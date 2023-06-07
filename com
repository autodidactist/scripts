#!/bin/bash

# This script will compile or run another finishing operation on a document. I
# have this script run via vim.
#
# Compiles .tex. groff (.mom, .ms), .rmd, .md, .org.  Opens .sent files as sent
# presentations. Runs scripts based on extention or shebang.
#
# Note that .tex files which you wish to compile with XeLaTeX should have the
# string "xelatex" somewhere in a comment/command in the first 5 lines.

# OB_CLEAR=rm *.o *.cmx *.cmo *.cmi
zapcc="/home/shahid/opt/build/bin/zapcc"
zapccpp="/home/shahid/opt/build/bin/zapcc++"

file=$(readlink -f "$1")
dir=${file%/*}
base="${file%.*}"
ext="${file##*.}"

cd "$dir" || exit 1

textype() { \
	command="pdflatex"
	( head -n5 "$file" | grep -qi 'xelatex' ) && command="xelatex"
	$command --output-directory="$dir" "$base" &&
	grep -qi addbibresource "$file" &&
	biber --input-directory "$dir" "$base" &&
	$command --output-directory="$dir" "$base" &&
	$command --output-directory="$dir" "$base"
}

case "$ext" in
	# Try to keep these cases in alphabetical order.
	[0-9]) preconv "$file" | refer -PS -e | groff -mandoc -T pdf > "$base".pdf ;;
	# c) cc  -std=c11  -g -static -Wall -Wextra -pedantic "$file" -o "$base" && "$base" ;;
	c) cc  -std=c11  -g  -Wall -Wextra -pedantic "$file" -o "$base" && "$base" ;;
	lhs|hs) runhaskell "$file";;
	# lhs|hs) ghc "$file" && "$base" ;;
	rs) rustc "$file" -o "$base" && "$base" ;;
	# -std=gnu++2a --> for GNU Extensions + C++20
	cpp|cc) $zapccpp -std=gnu++2a -g  -pedantic -O2 "$file" -o "$base" && "$base" ;;
	cs) mcs "$file" -o "$base" && mono "$base";;
	d) ldc2  "$file" &&  "$base" ;;
	# d) dmd  -O -of="$base" "$file" && "$base" && rm *.o;;
	fsx) fsharpc  --nologo    "$file" -o "$base"  && mono "$base" && rm *.dll "$base" ;;
	ml)ocaml "$file" -o "$base" && "$base";;
	go) go build  "$file" && "$base";;
	h) sudo make install ;;
	nim) nim   --hints:off  c "$file" && "$base";;
	v) v -prod "$file" -o "$base" && "$base" ;;
	java) javac -d classes "$file" && java -cp classes "${1%.*}" ;;
	m) octave "$file" ;;
	py) python3 "$file" ;;
	ex|exs)elixir "$file" ;;
	sent) setsid -f sent "$file" 2>/dev/null ;;
	tex) textype "$file" ;;
	*) sed -n '/^#!/s/^#!//p; q' "$file" | xargs -r -I % "$file" ;;
esac
