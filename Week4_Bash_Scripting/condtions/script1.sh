#! /bin/bash

read -p "enter your login name: " NAME

if [ $NAME == $USER ];
then
    echo "Hello $USER"
else
    echo "You are not the right one but hello $NAME anyway"
fi

