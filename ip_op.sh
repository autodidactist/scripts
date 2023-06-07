#!/bin/sh


# Check file type
file=$(readlink -f "$1")
dir=${file%/*}
base="${file%.*}"
ext="${file##*.}"

cd "$dir"

case "$ext" in
   cpp|py)
      find *put.txt &&  rm *put.txt || touch input.txt output.txt
      ;;

   esac
