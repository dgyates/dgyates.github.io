#!/usr/bin/env bash

#call scriptname.sh URL indexfilename
fileName="$1"
fileNamePrefix=$(echo "$fileName"|cut -d"." -f1)
fileNamePrefix="SeanDonnellanCV"

echo "making $fileName into $fileNamePrefix.doc"
pandoc $fileName -t docx -o /data/$fileNamePrefix.doc
echo "making $fileName into $fileNamePrefix.pdf"
pandoc $fileName -t latex -o /data/$fileNamePrefix.pdf