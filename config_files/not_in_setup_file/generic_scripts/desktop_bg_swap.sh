#!/bin/sh

arg=$1

if [ "$1" = "" ]; then
    echo "Need an arg to specify length of time between wallpapers";
    exit 1;
fi

if [ "$2" != "" ]; then
    echo "Only 1 arg is valid";
    exit 1;
fi

while :
do
    for file in /home/jasio/Pictures/wallpapers/*;
    do
        feh --bg-scale $file;
        sleep $arg;
        echo "File to display: $file";
    done
done
