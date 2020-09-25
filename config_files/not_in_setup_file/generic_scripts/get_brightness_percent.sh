#!/bin/bash
read -r curr_brightness < /sys/class/backlight/intel_backlight/brightness

(( curr_brightness /= 200 )) # divide by 100/max_brightness to get brightness as a percentage: (100/20000)

echo "Brightness: $curr_brightness%"
