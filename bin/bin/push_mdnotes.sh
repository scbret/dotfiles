#!/usr/bin/env bash

# Change directory to /repos/journal
cd /home/steve/repos/linux/mdnotes || exit

# get hostname of device being run on
hostname=$(hostnamectl | awk -F ': ' /Static hostname/ {print $2}')

# Add all changes to the staging area
git add .

# Commit changes
git commit -m "$hostname"

# Push changes to the remote repository
git push

# cd back to home
cd /home/steve || exit

notify-send "mdnotes push update complete!"
