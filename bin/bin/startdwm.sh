#!/bin/sh

feh --bg-scale ~/wallpaper/mountain-stream.jpg
dwmblocks &
exec picom --config ~/.config/picom-dwm/picom.conf &

while true; do
    # Log stderror to a file
    dwm 2> ~/.dwm.log
    # No error logging
    # dwm >/dev/null 2>&1
done

