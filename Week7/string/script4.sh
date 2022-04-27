#!/bin/bash

read -p "enter your name: " name
read -p "enter your surname: " surname
domain="@epoka.edu.al"
year=`date +"%y"`
email=${name:0:1}${surname:0:9}${year}${domain}
echo "email: $email"
str1=${name:${#name}-3}
str2=${surname:${#surname}-3}
year=`date +"%d-%m-%y"`
password=${str1^^}"#"${str2,,}"#"${year}
echo "password: $password"