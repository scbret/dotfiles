#!/bin/bash

# Change directory to /repos/journal
cd /home/steve/repos/journal || exit

# Push changes to the remote repository
git pull

echo "Journal update complete!"
