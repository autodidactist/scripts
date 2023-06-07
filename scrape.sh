#!/bin/sh
SITE=$1
wget -c \
     --recursive \
     --no-clobber \
     --page-requisites \
     --html-extension \
     --convert-links \
     --restrict-file-names=windows \
	 	 --user-agent=Mozilla \
     --no-parent \
	   --no-check-certificate \
		 $SITE
