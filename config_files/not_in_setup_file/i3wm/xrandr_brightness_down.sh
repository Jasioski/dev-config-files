#!/bin/bash

# Script to split a string based on the delimiter
curr_brightness=$(xrandr --verbose --current | grep Brightness)

echo "current: ${curr_brightness}"

IFS=' ' read -ra my_array <<< "$curr_brightness"

new_brightness=$(bc -l <<< ${my_array[1]}-0.1)
echo "new: ${new_brightness}"

if (( $(echo "${new_brightness} < 0.1" | bc -l) ))
    then
        echo "Lower than 10%"
        exit 1
fi

echo "Decreased brightness to: ${new_brightness}"

xrandr --output eDP-1 --brightness ${new_brightness}
