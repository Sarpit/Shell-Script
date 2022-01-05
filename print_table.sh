#!/bin/bash
read -p "Enter a number to print its table: " number

if [[ $number -gt 1 ]]
then 
    for i in {1..10}
    do

        echo "$number x $i = $(( $number*$i ))"
    done
else
    echo "Enter a positive Number"
fi