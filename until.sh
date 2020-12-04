#!/bin/bash

#setting our variables.
Today=1
NewYears=31

# -eq is used for checking if two integers are equal.
until [ $Today -eq $NewYears ]		#Will exit the loop when Today=31
do
	echo -n "Not yet..."
	Today=$[ $Today + 1 ] 		#Another way to iterate up by 1
done
echo "Happy New Years!"
