#!/bin/bash

while true; do
   if playerctl -p spotify status 2>/dev/null | grep -q "Playing"; then
       spotify_title=$(playerctl -p spotify metadata --format '{{ artist }} - {{ title }}')
       printf "%s\n" "$spotify_title"
   else
       printf "%s\n" ""
   fi
   sleep 5
   clear
done
