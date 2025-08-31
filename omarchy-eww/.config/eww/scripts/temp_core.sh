#!/usr/bin/env bash
# Usage: temp_core.sh INDEX
# Attempts to read "Core N:" temps from lm_sensors; falls back to nth core temp line.

idx="${1:-0}"

# Try exact "Core N:" match first
out=$(sensors 2>/dev/null | awk -v i="$idx" '$1=="Core" && $2==i":" {print $3; exit}')
# Fallback: the N+1-th "Core .*:" line
if [ -z "$out" ]; then
  out=$(sensors 2>/dev/null | awk '/^Core [0-9]+:/{print $3}' | sed -n "$((idx + 1))p")
fi

# If still empty, print blank (eww will render empty label)
[ -z "$out" ] && {
  echo ""
  exit 0
}
echo "$out" | tr -d '+°C' | cut -d'.' -f1
