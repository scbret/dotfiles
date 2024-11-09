#!/usr/bin/env bash

# read the keybinds text file
kbinds=$(cat ~/dotfiles/key_binds_dwm.txt)

# pipe the list to dmenu
echo "$kbinds" | dmenu -i -l 30
