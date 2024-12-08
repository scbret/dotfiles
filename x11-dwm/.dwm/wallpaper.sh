#!/usr/bin/env sh

wallpaper=$(ls ~/wallpaper | dmenu -i -l 20)

[ $wallpaper -z ] || feh --bg-scale /home/steve/wallpaper/$wallpaper
