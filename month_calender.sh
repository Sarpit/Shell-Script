#!/bin/bash

#Script to modify "cal" command to display calenders of the specified months of current year

month=$1
year=2021

if [[ $month -lt 1 || $month -gt 12 ]]
then
    echo "Invalid Month"
else
    cal $month $year
fi