#! /bin/bash
# this is a comment
echo "home dir is: `pwd`"

NAME=foo
HOBBY=imperialism
FULL_NAME="Foo Bar Quux"

echo "Welcome $NAME, your hobby is $HOBBY and your full name is $FULL_NAME"
FILE=`ls -1 *.txt | sort | tail -1`
echo "your last text file is: $FILE"

# The Pipe is a command in Linux that lets you use two or more commands such that output of one command serves as input to the next
# sort command helps in sorting alphabetically
# tail -number  will display the last part of a file


# 1) what if we leave off the last backtick
# 2) what if we use quotes instead

x=10
y=20
z="$x + $y"
let sum="$x + $y"

echo "z=$z" | bc
echo "sum=$sum"

# $((...)) is a built-in construct that can parse
# its contents as integers; valid identifiers
x=15
y=5
z=$((x - y))
echo "z=$z"

x=0.01
y=0.005

# bc parses its input to perform math
xy=$(echo "$x + $y" | bc)
echo "xy=$xy"

echo "hostname $HOSTNAME"
echo "home $HOME"
echo "list of directories holding commands to execute $PATH"
echo "current dir $PWD"
echo "user $USER"
