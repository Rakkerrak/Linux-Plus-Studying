#!/bin/bash


#setting our variables
Today=1
NewYears=31

#-lt is less than.
while [ $Today -lt $NewYears ]	#while loop syntax [] allow us to compare two things.
do
	echo -n "Not yet... "	#-n takes out the newline.
	((Today++))		#make sure you count up for each day.
done
echo "Happy New Years!"		#the loop exits on 31 an prints Happy New Year

