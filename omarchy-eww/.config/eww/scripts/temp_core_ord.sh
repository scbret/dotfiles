#!/usr/bin/env bash
# Prints the temperature (integer °C) for the Nth "Core <num>:" line
ord="${1:-0}"
val=$(sensors 2>/dev/null | awk '/^Core [0-9]+:/{print $3}' | sed -n "$((ord + 1))p")
[ -z "$val" ] && {
  echo ""
  exit 0
}
echo "$val" | tr -d '+°C' | cut -d'.' -f1
