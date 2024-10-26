#!/usr/bin/env bash

# Change directory to /repos/journal
cd /home/steve/repos/linux/mdnotes || exit

# Add all changes to the staging area
git add .

# Commit changes
git commit -m "slg-arch"

# Push changes to the remote repository
git push

# cd back to home
cd /home/steve || exit

notify-send "mdnotes push update complete!"
