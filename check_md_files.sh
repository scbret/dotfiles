#!/bin/bash

# Set the path to the directory you want to check
directory_path="$HOME/repos/linux/mdnotes"

# Loop through all files in the specified directory
for file in "$directory_path"/*; do
  # Check if the file is a markdown file
  if [[ "$file" == *.md ]]; then
    # Ask the user what they want to do with the file
    read -p "File found: $file. Do you want to delete (d), edit (e) or keep (k)? " response

    # Check the user's response
    case $response in
      d)
        # Delete the file if the user chooses to do so
        rm "$file"
        echo "File deleted."
        ;;
      e)
        # Open the file in nvim for editing
        if [ -f "$file" ]; then
          nvim "$file"
          echo "File edited."
        else
          echo "File not found. Please try again."
        fi
        ;;
      k)
        # Don't delete or edit the file if the user chooses to keep it
        echo "File kept."
        ;;
      *)
        # Display an error message if the user enters anything else
        echo "Invalid response. Please enter 'd' to delete, 'e' to edit or 'k' to keep."
        ;;
    esac
  fi
done

