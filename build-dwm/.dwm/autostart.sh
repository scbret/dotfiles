#!/usr/bin/env bash

#slstatus &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# backgrounf
feh --bg-scale ~/wallpaper/pfback-titles.jpg &

picom --animations -b &

# One Drive 
sh -c "rclone --vfs-cache-mode writes mount \"onedrive\": ~/OneDrive"


#while true; do
#	xsetroot -name "**** SwineID ****"
#	sleep 60
#done &

dunst &
