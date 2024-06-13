#!/usr/bin/env bash

# I added a parameter just to be fancy and for practice.
NUMBER=$1

#The while loop will start with this number and loop until the number specified as a parameter is met.

COUNT=2

while [ $COUNT -le $1 ]
do
	echo "COUNT = $COUNT"
	((COUNT++))			# I don't know what this does. Increments the counter by 1?
done

echo "while loop finished."
exit 0
