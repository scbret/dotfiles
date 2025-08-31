#!/usr/bin/env bash
# Parse lm_sensors for Core 0..11 temps; prints "42 39 40 ..."
temps=()
while IFS= read -r line; do
  t=$(echo "$line" | awk '{print $3}' | tr -d '+°C')
  temps+=("${t%%.*}")
done < <(sensors 2>/dev/null | awk '/Core [0-9]+:/{print}' | head -n 12)
# Pad to 12 with blanks if fewer cores
for ((i = ${#temps[@]}; i < 12; i++)); do temps+=(""); done
printf "%s\n" "${temps[*]}"
