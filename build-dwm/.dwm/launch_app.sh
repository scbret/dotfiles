#!/usr/bin/env sh

# read the apps list text file
apps=$(cat ~/.dwm/apps.txt)

# pipe the list to dmenu
dmenu -i -l 30 -p "Select an app:" <<< "$apps"
notify-send "Your app was selected"
