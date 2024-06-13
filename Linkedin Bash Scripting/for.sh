#!/usr/bin/env bash

# $@ represents a parameter array or all the parameters type after the script name at the command line.

NAMES=$@

# This script cycles through a list of names enter as parameters.
# If a for loop is excuted with no parameters it will still run.

for NAME in $NAMES
do
	if [ $NAME = "Andy" ]
	then

#the break statement stops the loop from executing once the if condition is met.
#the continue statement basically omits the value referenced in the if statement then the script goes back to the top and loops through the rest of the parameters.

		continue
	fi
	echo "Hello $NAME!"
done

echo "for loop is done with no more names to go through"

exit 0
