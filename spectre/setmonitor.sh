#!/usr/bin/env bash

if $( cat /proc/acpi/button/lid/LID0/state | grep -q open )
then
    xrandr --output eDP1 --primary --mode 2560x1440 --pos 0x0 --rotate normal
else
    xrandr --output eDP1 --off --output DP1 --off --output DP2 --primary --mode 3840x2160 --pos 0x0 --rotate normal --output VIRTUAL1 --off
	
fi
