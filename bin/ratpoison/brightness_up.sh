#!/bin/bash

current_brightness=`xrandr --current --verbose | grep Brightness | awk '{print $2}'`
new_brightness=$(echo "$current_brightness + 0.1" | bc -l)
cmp=$(echo $current_brightness "< 1.0" | bc -l)

if [ $cmp -eq 1 ]; then
    xrandr --output eDP1 --brightness $new_brightness
    ratpoison -c "echo Brightness : $new_brightness";
fi
