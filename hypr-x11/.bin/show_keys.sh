#!/usr/bin/env bash

KEYBINDS_FILE="$HOME/dotfiles/key_binds_hypr.txt"

# Check if the file exists
if [ ! -f "$KEYBINDS_FILE" ]; then
    echo "Error: $KEYBINDS_FILE not found"
    exit 1
fi

# Display the contents using wofi
cat "$KEYBINDS_FILE" | wofi --dmenu \
    -d \
    --lines 20 \
    --width 500 \
    --height 500 \
    --prompt "Hyprland Keybinds" \
    --cache-file /dev/null \
    --disable-search true