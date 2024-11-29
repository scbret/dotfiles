#!/bin/bash

if playerctl -p spotify status 2>/dev/null | grep -q "Playing"; then
    spotify_title=$(playerctl -p spotify metadata --format '{{ artist }} - {{ title }}')
    echo "$spotify_title"
fi