#! /bin/bash

# accept a file name
# check if file exists
# if file exists copy the file to the same name + .bak + the current date
# if the backup file already exists ask if you want to replace it

read -p "enter the file name: " FILE_NAME

if [ -e $FILE_NAME ]; then
    DATE=$(date "+%Y-%m-%d")
    NEW_FILE="$FILE_NAME.bak$DATE"
    if [ -e $NEW_FILE ];
    then
        read -p "backup already exists, do you want to replace it? (y=yes)" REPLACE
        if [ "$REPLACE" = "y" -o "$REPLACE" = "yes" ];
        then
            echo "copying the backup $FILE_NAME"
            cp $FILE_NAME $NEW_FILE
        else
            echo "you chose not to copy!"
        fi
    else
        cp $FILE_NAME $NEW_FILE
    fi
fi
