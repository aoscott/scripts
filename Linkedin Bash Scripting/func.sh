#!/usr/bin/env bash


function Hello() {
	local LNAME=$1
	echo "Hello $LNAME"
}

#When creating a second function after the first function the function declaration is omitted.

Goodbye() {
	echo "Goodbye $1"
}

#Functions are invoked simply by their name.
#Need to know the difference between global and local variables.

echo "Calling the Hello function"
Hello Andy!


echo "Calling the goodbye function"
Goodbye Shobha!


exit 0



