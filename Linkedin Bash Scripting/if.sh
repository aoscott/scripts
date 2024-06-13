#!/usr/bin/env bash

COLOR=$1

if [ $COLOR = "blue" ]
then
	echo "The color is blue"
else
	echo "Not the color that's on my mind!"
fi

USER_GUESS=$2
COMPUTER=50

if [ $USER_GUESS -lt $COMPUTER ]
then
	echo "You're to low and not that smart!"
elif [ $USER_GUESS -gt $COMPUTER ]
then
	echo "Way to high my friend!"
else 
	echo "You're right on the money!!"
fi

# In if and elif statements must be followed by "then"
# An "else" statement must be used after an "elif" clause.
# if statements are closed by "fi"
