#!/bin/bash

read -p "Enter a number to calculate its factorial : " number
fact=1

if [[ $number -gt 1 ]]
then
    for (( i=$number ; i>1 ; i--))
    do
        fact=$(($fact * i))
    done
    echo "Factorial of $number is $fact"
else
    echo "Enter a positive Number"
fi