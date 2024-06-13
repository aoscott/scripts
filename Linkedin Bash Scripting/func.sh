#!/usr/bin/env bash


function Hello() {
	echo "Hello"
}

#When creating a second function after the first function the function declaration is omitted.

Goodbye() {
	echo "Goodbye"
}

#Functions are invoked simply by their name.

echo "Calling the Hello function"
Hello


echo "Calling the goodbye function"
Goodbye


exit 0



