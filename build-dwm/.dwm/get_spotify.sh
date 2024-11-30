#!/bin/bash

while true; do
   if playerctl -p spotify status 2>/dev/null | grep -q "Playing"; then
       spotify_title=$(playerctl -p spotify metadata --format '{{ artist }} - {{ album }} - {{ title }}')
       printf "%s\n" "$spotify_title"
   else
       printf "%s\n" "Not Currently Playing"
   fi
   sleep 5
   clear
done
