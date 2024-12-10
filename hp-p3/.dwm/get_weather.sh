#!/usr/bin/env bash

STATUS_FILE="$HOME/.dwm/status"

check_connection() {
    ping -c 1 8.8.8.8 >/dev/null 2>&1
    return $?
}

if check_connection; then
    curl -s "wttr.in/mason+city?u&format=%c+%m+H:%h+A:%t+F:%f+W:%w"
else
    echo "No Internet Connection"
fi
