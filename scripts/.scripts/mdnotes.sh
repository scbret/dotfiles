#!/usr/bin/env sh
set -eu

folder="$HOME/repos/linux/mdnotes" # no trailing slash
mkdir -p "$folder"

# Prefer kitty if available, else just run nvim in current terminal
open_editor() {
  file="$1"
  if command -v kitty >/dev/null 2>&1; then
    setsid -f kitty -e nvim -- "$file" >/dev/null 2>&1 || true
  else
    nvim -- "$file"
  fi
}

newnote() {
  # If fzf exists, use it to capture a name (with empty initial line); else prompt
  if command -v fzf >/dev/null 2>&1; then
    # Show a one-line “prompt”; user will type then press Enter
    printf "Enter a name (no extension): " 1>&2
    # Read from tty to avoid piping quirks
    IFS= read -r name </dev/tty || name=""
  else
    printf "Enter a name (no extension): " 1>&2
    IFS= read -r name || name=""
  fi

  [ -z "${name:-}" ] && exit 0

  case "$name" in
  *.md) note="$folder/$name" ;;
  *) note="$folder/$name.md" ;;
  esac

  open_editor "$note"
}

choose_existing_or_new() {
  # Collect markdown files (filenames only), newest first.
  # Handles empty folder gracefully.
  files=$(
    # Find .md files and sort by mtime descending
    find "$folder" -maxdepth 1 -type f -name '*.md' -printf '%T@ %f\n' |
      sort -nr |
      awk '{ $1=""; sub(/^ /,""); print }'
  )

  if command -v fzf >/dev/null 2>&1; then
    # Fancy picker with fzf
    choice=$( (
      printf '%s\n' "New"
      printf '%s\n' "$files"
    ) |
      fzf --prompt="Choose note or create new: " --height=40% --reverse --tac || true)
    case "${choice:-}" in
    "") exit 0 ;;
    "New") newnote ;;
    *".md") open_editor "$folder/$choice" ;;
    *) exit 0 ;;
    esac
  else
    # Plain terminal prompt
    echo "Choose note or create new:"
    echo "  0) New"
    i=1
    # Build a numbered menu
    # shellcheck disable=SC2086
    for f in $files; do
      printf "  %d) %s\n" "$i" "$f"
      i=$((i + 1))
    done

    printf "Enter a number: " 1>&2
    IFS= read -r ans || exit 0
    case "${ans:-}" in
    0) newnote ;;
    '' | *[!0-9]*) exit 0 ;; # non-number
    *)
      idx="$ans"
      # Map number back to filename
      j=1
      sel=""
      # shellcheck disable=SC2086
      for f in $files; do
        [ "$j" -eq "$idx" ] && sel="$f" && break
        j=$((j + 1))
      done
      [ -z "$sel" ] && exit 0
      open_editor "$folder/$sel"
      ;;
    esac
  fi
}

choose_existing_or_new
