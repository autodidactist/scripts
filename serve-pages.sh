#!/bin/bash

cd "$HOME/Docs"

declare options=("anarchistneet.xyz
blog.cleancoder.com
cp-algorithms.com
cplusplus.com
docs.voidlinux.org
drewdevault.com
intellectualmathematics.com
josephmellor.xyz
jvns.ca
latex-tutorial.com
leetcodetherapy.com
lukesmith.xyz
madhavkaushish.substack.com
martinkaptein.com
modern-cpp
sites.math.rutgers.edu
steve-yegge.blogspot.com
steveyegge2
v2.ocaml.org(API)
v2.ocaml.org(REFERENCE)
web.mat.bham.ac.uk
haskell
writings.stephenwolfram.com
www.aqrtsufi.org
www.basic-mathematics.com
www.felderbooks.com
www.goodmath.org
www.learn-c.org
www.math-only-math.com
www.rashidahakim.org
www.sacredlearning.org
www.scottaaronson.com
ziglearn.org
Go.docset")

# FILE=$(printf  "${options[@]}" | dmenu -i -fn "mono-16" -p "$1" -nb  "#1d1100"  -sb "#6fa695" -sf "#010101" -nf gray  -p 'Web-Pages:')
FILE=$(ls | dmenu -i -l 10 -fn "mono-16" -p "$1" -nb  "#1d1100"  -sb "#6fa695" -sf "#010101" -nf gray  -p 'Web-Pages:')

dir=$(readlink -f "$FILE")

# dir="$HOME/Docs"
cd $dir;
# echo "$FILE"

# exit 1;
if [ "$FILE" == "" ] 
then
   exit 1;
else
   case "$FILE" in
   "anarchistneet.xyz")
      serve 8801 
      ;;
   "blog.cleancoder.com")
      serve 8802 
      ;;
   "cp-algorithms.com")
      serve 8803 
      ;;
   "cplusplus.com")
      serve 8804 
      ;;
   "docs.voidlinux.org")
      serve 8805 
      ;;
   "drewdevault.com")
      serve 8806 
      ;;
   "intellectualmathematics.com")
      serve 8807 
      ;;
   "josephmellor.xyz")
      serve 8808 
      ;;
   "jvns.ca")
      serve 8809 
      ;;
   "latex-tutorial.com")
      serve 8810 
      ;;
   "leetcodetherapy.com")
      serve 8811 
      ;;
   "lukesmith.xyz")
      serve 8812 
      ;;
   "madhavkaushish.substack.com")
      serve 8813 
      ;;
   "martinkaptein.com")
      serve 8814 
      ;;
   "modern-cpp")
      serve 8815 
      ;;
   "sites.math.rutgers.edu")
      serve 8816 
      ;;
   "steve-yegge.blogspot.com")
      serve 8817 
      ;;
   "steveyegge2")
      serve 8818 
      ;;
   "v2.ocaml.org(API)")
      cd "/home/shahid/Docs/v2.ocaml.org(API)/api/";
      serve 8819 
      ;;
   "web.mat.bham.ac.uk")
      serve 8820 
      ;;
   "writings.stephenwolfram.com")
      serve 8821 
      ;;
   "www.aqrtsufi.org")
      serve 8822 
      ;;
   "www.basic-mathematics.com")
      serve 8823 
      ;;
   "www.felderbooks.com")
      serve 8824 
      ;;
   "www.goodmath.org")
      serve 8825 
      ;;
   "www.learn-c.org")
      serve 8826 
      ;;
   "www.math-only-math.com")
      serve 8827 
      ;;
   "www.rashidahakim.org")
      serve 8828 
      ;;
   "www.sacredlearning.org")
      serve 8829 
      ;;
   "www.scottaaronson.com")
      serve 8830 
      ;;
   "ziglearn.org")
      serve 8831 
      ;;
   "python")
      serve 8832
      ;;
   "v2.ocaml.org(REFERENCE)")
      cd "/home/shahid/Docs/v2.ocaml.org(REFERENCE)/reference/" && serve 8834
      ;;
   "haskell")
      serve 8835
      ;;
   "cppreference")
      cd "/home/shahid/Docs/cppreference/reference/en.cppreference.com/"  && serve 8845  

      ;;
   "nim")
      cd "/home/shahid/Docs/nim/docs/"
      serve 8846 index.html
      ;;
   "Go.docset")
      cd /home/shahid/Docs/Go.docset/Contents/Resources/Documents && serve 8847
      ;;
   *)
      serve 8888 
      # exit 1
      ;;
   esac
fi
