#!/usr/bin/env bash
# Print Distro + Release in one line

if command -v lsb_release >/dev/null 2>&1; then
  distro=$(lsb_release -d | awk -F'\t' '{print $2}' | sed 's/[[:space:]]\+$//')
  release=$(lsb_release -r | awk -F'\t' '{print $2}' | sed 's/[[:space:]]\+$//')
elif [ -f /etc/os-release ]; then
  . /etc/os-release
  distro="$PRETTY_NAME"
  if [ -n "$VERSION" ]; then
    release="$VERSION"
  elif [ -n "$VERSION_ID" ]; then
    release="$VERSION_ID"
  else
    release="rolling"
  fi
else
  distro=$(uname -s)
  release=$(uname -r)
fi

# For Arch, PRETTY_NAME already contains "Arch Linux", and VERSION is empty
if echo "$distro" | grep -qi "arch"; then
  echo "$distro (rolling)"
else
  echo "$distro $release"
fi
