#! /bin/bash

read -p "what is your name? " name
read -p "how old are you? " age
printf "%s is %s years old\n" $name $age

echo "enter the name of file to delete:\n"

read file
echo "type 'y' to remove it, 'n' to change your mind ..."

rm -i $file

echo "done!"
