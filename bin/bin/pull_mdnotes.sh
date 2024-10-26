#!/usr/bin/env bash

# Change directory to /repos/journal
cd /home/steve/repos/linux/mdnotes || exit

# Push changes to the remote repository
git pull

# cd back to home
cd  /home/steve || exit

notify-send "mdnotes pull update complete!"
