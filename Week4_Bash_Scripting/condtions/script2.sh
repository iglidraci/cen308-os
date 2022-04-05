#! /bin/bash

read -p "enter a number between 1 and 10: " NUM
if [ "$NUM" -gt 0 ]; then
    if [ "$NUM" -lt 11 ]; then
        SQUARE=$((NUM * NUM))
        echo "square($NUM) = $SQUARE"
    else
        echo "Wrong input"
    fi
else
    echo "wrong input"
fi

