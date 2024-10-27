#!/usr/bin/env sh
folder=/home/steve/repos/linux/mdnotes/

newnote () {
    name="$(wofi --show dmenu --width=200 --height=100 --cache-file=/dev/null)"
    [ -n "$name" ] && setsid -f "kitty" -e nvim "$folder$name.md" >/dev/null 2>&1
}

selected () {
    choice="$(echo -e "New\n$(ls -1 $folder)" | wofi --show dmenu --width=300 --height=200 --cache-file=/dev/null -p "Choose note or create new: ")"
    case $choice in
        New) newnote ;;
        *md) setsid -f "kitty" -e nvim "$folder$choice" >/dev/null 2>&1 ;;
        *) exit ;;
    esac
}

selected