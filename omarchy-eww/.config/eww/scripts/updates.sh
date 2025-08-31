#!/usr/bin/env bash
# Needs pacman-contrib: sudo pacman -S pacman-contrib
if command -v checkupdates >/dev/null 2>&1; then
  checkupdates 2>/dev/null | wc -l
else
  echo "0"
fi
