#!/usr/bin/env bash

function GetFiles() {
#ls -1 | head -10
FILES=`ls -1 | sort | head -12`
}

## What I understand is the first function does the directory listing and the results are stored as parameters in $@ then passed to the second fuction ShowFiles.

function ShowFiles () {
#	local SFILES=$@
	local COUNT=1
	for FILE in $@
		do 
			echo "FILE #$COUNT = $FILE"
			((COUNT++))
			done
		}
	
#echo "Getting Files"

GetFiles

#echo "Showing Files"

ShowFiles $FILES


exit 0
