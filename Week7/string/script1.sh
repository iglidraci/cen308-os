#!/bin/bash

str=0123456789
# ${#string} gives the string length
echo ${#str}
# ${string:position} extracts sub-string from $string at $position
echo ${str:3}
# ${string:position:length} extracts $length characters 
# of sub-string from $string at $position
echo ${str:3:6}

# concatenation
s1=hello
s2=Word
s3=${s1}${s2}
echo $s3

# When concatenating strings, you may use string variables and string literals too
s4=${s1}" to the whole "${s2}
echo $s4

# capitalize the whole string, we use the syntax: ${str^^}
echo ${s4^^}
# capitalize only the first letter, we use the syntax: ${str^}
echo ${s4^}
# string to lowercase, we use the syntax: ${str,,}
str="This is AN ILLUSTRATING Example"
str2=${str,,}
echo $str2
# convert to lowercase only the first letter, we use the syntax: ${str,}
str3=${str,}
echo $str3