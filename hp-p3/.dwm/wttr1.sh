#!/bin/bash

# Function to check if wttr.in is available
check_wttr() {
    if curl -s --head --request GET "wttr.in" | grep "200 OK" > /dev/null; then
        return 0
    else
        return 1
    fi
}

# Main script
if check_wttr; then
    # Get weather data
    if curl -s "wttr.in/mason+city?u&format=%m+%C,+H:%h,+A:%t,+F:%f,+W:%w\n" > /tmp/wttr; then
        notify-send "Weather data successfully retrieved and saved"
    else
        notify-send "Error: Failed to retrieve weather data"
        exit 1
    fi
else
    echo "Error: wttr.in is not available" > /tmp/wttr
    exit 1
fi
