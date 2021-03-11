#!/usr/bin/env bash

#call scriptname.sh URL indexfilename

inputURL="$1"

wget -mkx -l 10 -e robots=off $inputURL
