#!/bin/bash

# Change directory to /repos/journal
cd /home/steve/dotfiles || exit

# Push changes to the remote repository
git pull

# cd back to home
cd  /home/steve || exit

echo "Dotfiles pull update complete!"
