#! /bin/bash

read -p "enter a number 1 < x < 4: " NR

case $NR in
    2) echo "value of NR is 2";;
    3) echo "value of NR is 4";;
    1 | 4) echo "wrong value";;
    *) echo "unrecognized value";;
esac
