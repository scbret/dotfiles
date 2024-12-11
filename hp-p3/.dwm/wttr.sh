#!/bin/bash

# Get weather data
if curl -s "wttr.in/mason+city?u&format=%m+%C,+H:%h,+A:%t,+F:%f,+W:%w\n" > /tmp/wttr; then
    notify-send "Weather data successfully retrieved and saved"
else
    echo "Error: Failed to retrieve weather data" > /tmp/wttr
    exit 1
fi
