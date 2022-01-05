#!/bin/bash
read -p "Enter a number to print its table: " number

for i in {1..10}
do
    echo "$number x $i = $(( $number*$i ))"
done