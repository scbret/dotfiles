#!/usr/bin/env bash
# Print release/version info (works across most distros)

if command -v lsb_release >/dev/null 2>&1; then
  lsb_release -r | awk -F'\t' '{print $2}' | sed 's/[[:space:]]\+$//'
elif [ -f /etc/os-release ]; then
  . /etc/os-release
  # Arch usually has VERSION="", so fallback to VERSION_ID
  if [ -n "$VERSION" ]; then
    echo "$VERSION"
  elif [ -n "$VERSION_ID" ]; then
    echo "$VERSION_ID"
  else
    echo "rolling"
  fi
else
  uname -r
fi
