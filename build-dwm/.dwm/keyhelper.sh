#!/usr/bin/env bash

# read the keybinds text file
kbinds=$(cat ~/dotfiles/keybinds_dwm1.txt)

# pipe the list to dmenu
echo "$kbinds" | dmenu -i -l 40
