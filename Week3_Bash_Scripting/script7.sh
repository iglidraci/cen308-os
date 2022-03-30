#!/bin/bash
#Usage of arithmetic operation is illustrated
read -p "Enter the first number: " x
read -p "Enter the second number: " y
res1=$(($x + $y))
res2=$(($x - $y))
res3=$(($x * $y))
res4=$(($x / $y))
res5=$(($x % $y))
#Priting the results:
echo "The sum is $res1"
echo "The diference is $res2"
echo "The product is $res3"
echo "The ratio is $res4"
echo "The remainder is $res5"
