#!/bin/sh

# Arguments
# echo $1 $2 $3 ' --> echo $1 $2 $3'
# args=("$@")
# echo $@
# echo $PWD
# mkdir -p $PWD/ok/j

# Read some files
source conf/spring.cfg

# Check if directory exists
# =========================

# If exists

if [ -d "$DIRECTORY" ]; then
    # Control will enter here if $DIRECTORY exists.
fi

# If does not exist
if [ ! -d "$DIRECTORY" ]; then
    # Control will enter here if $DIRECTORY doesn't exist.
fi

# Check simlink or directory

if [ -d "$LINK_OR_DIR" ]; then 
    if [ -L "$LINK_OR_DIR" ]; then
        # It is a symlink!
        # Symbolic link specific commands go here.
        rm "$LINK_OR_DIR"
    else
        # It's a directory!
        # Directory command goes here.
        rmdir "$LINK_OR_DIR"
    fi
fi

# OR
if [[ -d "${DIRECTORY}" && ! -L "${DIRECTORY}" ]] ; then
    echo "It's a bona-fide directory"
fi

# To check if two variables are equal
str1="Hi"
str2="Hello"

if [ $str1 = $str2 ]; then
        echo "Both are equal"
else
        echo "Not equal"
fi

# For numbers
NUM1=2
NUM2=1
if   [ $NUM1 -eq $NUM2 ]; then
    echo "Both Values are equal"
elif [ $NUM1 -gt $NUM2 ]; then
    echo "NUM1 is greater then NUM2"
else 
    echo "NUM2 is greater then NUM1"
fi 

# Assign output of a command to variable
# Replace . in package to directory /
BASE_PACKAGE="$GROUP_ID.mvc"
BASE_PACKAGE_DIR=`echo "$BASE_PACKAGE" | tr \. /`
