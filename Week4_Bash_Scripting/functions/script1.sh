#! /bin/bash

function hello() {
    echo "$1 says $2"
}

hello "Foo" "hi"

a=1
b=2

function foo() {
    a=2
    local b=3
    echo "inside the function: a=$a and b=$b"
}

echo "before calling the function: a=$a and b=$b"

foo

echo "after calling the function: a=$a and b=$b"

function square_it() {
    return $(($1*$1))
}

function rec() {
    if [ "$1" -eq "1" ];
    then
        echo $1
        return
    else
        echo $1
        let next=$(($1-1))
        rec next
    fi
}

read -p "what number do you want to square: " NR
square_it $NR
echo $?

rec 5

