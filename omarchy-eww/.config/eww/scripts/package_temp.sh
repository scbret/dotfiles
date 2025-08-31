#!/usr/bin/env bash
val=$(sensors 2>/dev/null | awk '/^Package id 0:/{print $4}' | head -n1)
[ -z "$val" ] && {
  echo ""
  exit 0
}
echo "$val" | tr -d '+°C' | cut -d'.' -f1
