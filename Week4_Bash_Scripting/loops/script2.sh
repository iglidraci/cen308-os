#! /bin/bash

let loop=1

while [ $loop -eq 1 ];
do
    echo "MENU"
    echo "===="
    echo "D: print date"
    echo "U: print the users which are currently logged on"
    echo "C: print current working directory"
    echo "Q: quit the program"
    read -s CHOICE # silent mode, don't echo to the teriminal
    case $CHOICE in
        D | d)date;;
        U | u)who;;
        C | c)pwd;;
        Q | q)let loop=0;;
        *)echo "invalid command";;
    esac
done

