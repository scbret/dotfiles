#!/usr/bin/env bash
# Print pretty distro name (works on Arch, Debian, Ubuntu, Fedora, etc.)

if command -v lsb_release >/dev/null 2>&1; then
  lsb_release -d | awk -F'\t' '{print $2}' | sed 's/[[:space:]]\+$//'
elif [ -f /etc/os-release ]; then
  . /etc/os-release
  echo "$PRETTY_NAME"
else
  uname -sr
fi
