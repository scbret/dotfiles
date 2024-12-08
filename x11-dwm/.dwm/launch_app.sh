#!/usr/bin/env sh

# read the apps list text file
apps=$(cat ~/.dwm/apps.txt)

# pipe the list to dmenu and capture selected app
selected_app=$(echo "$apps" | dmenu -i -l 30 -p "Select an app:")

# launch selected app if not empty
if [ -n "$selected_app" ]; then
	notify-send "Launching: $selected_app"
	$selected_app &
else
	notify-send "No app selected"
fi

