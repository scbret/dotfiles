#!/usr/bin/env bash
# Usage: mem_field.sh mem_used|mem_total|mem_perc|swap_used|swap_total|swap_perc
case "$1" in
mem_used)
  read -r total used _ _ < <(free -m | awk '/^Mem:/ {print $2,$3,$4,$5}')
  echo "${used}MiB"
  ;;
mem_total)
  read -r total _ _ _ < <(free -m | awk '/^Mem:/ {print $2,$3,$4,$5}')
  echo "${total}MiB"
  ;;
mem_perc)
  read -r total used _ _ < <(free -m | awk '/^Mem:/ {print $2,$3,$4,$5}')
  ((total > 0)) && echo $((100 * used / total)) || echo 0
  ;;
swap_used)
  read -r total used _ < <(free -m | awk '/^Swap:/ {print $2,$3,$4}')
  echo "${used:-0}MiB"
  ;;
swap_total)
  read -r total _ _ < <(free -m | awk '/^Swap:/ {print $2,$3,$4}')
  echo "${total:-0}MiB"
  ;;
swap_perc)
  read -r total used _ < <(free -m | awk '/^Swap:/ {print $2,$3,$4}')
  ((total > 0)) && echo $((100 * used / total)) || echo 0
  ;;
*) echo "0" ;;
esac
