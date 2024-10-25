#!/usr/bin/env bash

slstatus &

sh -c "rclone --vfs-cache-mode writes mount \"onedrive\": ~/OneDrive"

