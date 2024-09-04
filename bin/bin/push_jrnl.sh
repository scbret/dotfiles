#!/bin/bash

# Change directory to /repos/journal
cd /home/steve/repos/journal || exit

# Add all changes to the staging area
git add .

# Commit changes
git commit -m "spectre-arco"

# Push changes to the remote repository
git push

echo "Journal update complete!"
