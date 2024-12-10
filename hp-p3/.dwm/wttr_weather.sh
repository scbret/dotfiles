#!/bin/bash

# Function to check if wttr.in is online
is_wttr_online() {
    curl -s --head --request GET http://wttr.in | grep "200 OK" > /dev/null 2>&1
}

# Function to fetch weather data and extract required information
fetch_weather() {
    local response=$(curl -s "http://wttr.in/MasonCity,IA?format=j1")
    
    # Extracting humidity, temperature, and wind speed using jq (make sure jq is installed)
    humidity=$(echo "$response" | jq -r '.current_condition[0].humidity')
    temperature=$(echo "$response" | jq -r '.current_condition[0].temp_F')
    windspeed=$(echo "$response" | jq -r '.current_condition[0].windspeedMiles')

    echo "Humidity: $humidity%"
    echo "Temperature: ${temperature}°F"
    echo "Wind Speed: ${windspeed} mph"
}

# Check if wttr.in is online
if is_wttr_online; then
    # Fetch and display weather data
    fetch_weather | tee /tmp/wttr
else
    # Output "weather offline" to /tmp/wttr
    echo "weather offline" > /tmp/wttr
fi
