#!/bin/bash

# Configuration
WEATHER_URL="wttr.in"
CITY="mason+city"
OUTPUT_FILE="/tmp/wttr"
TIMEOUT=5  # Timeout in seconds for the availability check

# Function to check if a host is available
check_host_availability() {
    local host=$1
    nc -z -w $TIMEOUT $host 80 2>/dev/null
    return $?
}

# Function to fetch weather data
fetch_weather() {
    curl -s "wttr.in/${CITY}?u&format=%m+%C,+H:%h,+A:%t,+F:%f,+W:%w\n" > "$OUTPUT_FILE"
    if [ $? -ne 0 ]; then
        echo "Weather Offline" > "$OUTPUT_FILE"
        return 1
    fi
    return 0
}

# Main execution
if check_host_availability "$WEATHER_URL"; then
    fetch_weather
else
    echo "Weather Offline" > "$OUTPUT_FILE"
fi
