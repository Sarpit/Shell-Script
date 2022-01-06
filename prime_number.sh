#!/bin/bash

function isprime() {
    num=$1
    flag=0
    for (( i=2 ; i < $num / 2 ; i++ ))
    do
        if [[ $num%i -eq 0 ]]
        then
            flag=1
            echo "$num is not Prime"
            break
        fi
    done
    return $flag
}

number=$1
if [[ $number -eq 0 || $number -eq 1 ]]
then 
    echo "$number is not Prime"
elif [[ $number -lt 0 ]]
then
    echo "Enter a positive no"
else
    isprime $number
    flag=$?
    if [[ $flag -eq 0 ]]
    then
        echo "$number is Prime"
    fi
fi

