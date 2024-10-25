#!/usr/bin/env bash

# Change directory to /repos/journal
cd /home/steve/dotfiles || exit

# Add all changes to the staging area
git add .

# Commit changes
git commit -m "spectre-arco"

# Push changes to the remote repository
git push

# cd back to home
cd /home/steve || exit

echo "Dotfiles push update complete!"
