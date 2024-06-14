#!/usr/bin/env bash

COUNT=1

#IFS is the "Internal Field Separator. Parses lines being read.

while IFS='' read -r LINE
do
	echo "LINE $COUNT: $LINE"
	((COUNT++))
done < $1

exit 0
