#!/bin/bash
set -x
exec 2>"$HOME/myscript.log"

arg=$1

read -r curr_brightness < /sys/class/backlight/intel_backlight/brightness

new_brightness=$curr_brightness

if [[ "$arg" == "-u" ]]
then
    (( new_brightness += 1000 ))

elif [[ "$arg" == "-d" ]]
then
    (( new_brightness -= 1000 ))

else
    echo "invalid arg"
    exit 1
fi

if  (( new_brightness > 20000 ))
then
    new_brightness=20000
    echo >&2 "Max brightness"
fi

if  (( new_brightness < 1000 ))
then
    new_brightness=1
    echo >&2 "Min brightness"
fi

echo $new_brightness|sudo tee /sys/class/backlight/intel_backlight/brightness
