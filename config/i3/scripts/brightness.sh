#!/bin/bash

output=`xrandr | grep " connected" | cut -d " " -f 1`
brightness=`xrandr --verbose | grep Brightness | grep -o '[0-9].*'`

if [ $1 == "up" ]; then
	brightness=`echo "$brightness 0.1" | awk '{printf "%f", $1 + $2}'`

	if (( `echo "$brightness > 1" | bc -l` )); then
		brightness=1
	fi
elif [ $1 == "down" ]; then
	brightness=`echo "$brightness 0.1" | awk '{printf "%f", $1 - $2}'`

	if (( `echo "$brightness < 0" | bc -l` )); then
		brightness=0
	fi
fi

brightness=`xrandr --output "$output" --brightness "$brightness"`

