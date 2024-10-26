#!/usr/bin/env bash

sh -c "rclone --vfs-cache-mode writes mount \"onedrive\": ~/OneDrive"

exec wal -n -i "~/wallpaper/valley-sunset.jpg"
