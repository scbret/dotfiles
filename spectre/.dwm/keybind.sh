#!/usr/bin/env bash

# Terminal styling variables
bold=$(tput bold)
normal=$(tput sgr0)

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Path to the dotfiles folder
folder=~/dotfiles

# Path to the custom text file inside the dotfiles folder
custom_bindings_file="$folder/key_binds_dwm.txt"

# Check if the custom file exists
if [ -f "$custom_bindings_file" ]; then
    # Open the file using st and less with customized prompt
    st -e bash -c "
        cat \"$custom_bindings_file\" | {
            while IFS= read -r line; do
                if [[ \"\$line\" == \"\${line^^}\" ]]; then
                    echo -e \"${RED}\$line${NC}\"
                else
                    echo \"\$line\"
                fi
            done
        } | less -R -P '[more]'" 
else
    echo "Custom bindings file not found: $custom_bindings_file"
fi


