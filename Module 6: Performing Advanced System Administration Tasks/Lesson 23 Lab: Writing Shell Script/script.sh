#!/bin/bash

#This script takes al files ending with .txt extension from location mentioned in first parameter and moves them to /tmp

if [ -z $1 ]
then
	echo 'Please provide location of the files as first argument'
	exit 9
fi

LOCATION=$1

cd $LOCATION

for file in *
do
	if [ "${file: -4}" == ".txt" ]  && [ -f $file ]
	then
		echo Found $file
		cp $file $file.bak
		mv $file.bak /tmp
	fi
done

echo
echo "Output of ls on /tmp:"
echo "$(ls /tmp)"

