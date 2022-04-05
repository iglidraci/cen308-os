#!/bin/bash

echo "guess a number between 1 and 10"

NR_GUESSES=0

let SECRET=$(($RANDOM%10 + 1))

echo $SECRET

let GUESS=-1

until [ $GUESS -eq $SECRET ];
do
    NR_GUESSES=$((NR_GUESSES+1))
    read -p "enter your guess: " GUESS
    if [ $GUESS -lt $SECRET ];
    then
        echo "your guess is less then the secret number"
    elif [ $GUESS -gt $SECRET ];
    then
        echo "your guess is greater then secret number"
    fi
done

echo "you guessed after $NR_GUESSES guesses"

