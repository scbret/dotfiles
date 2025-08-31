#!/usr/bin/env bash
# Usage: memswap.sh mem|swap -> "used total percent"
case "$1" in
mem)
  read -r total used free shared < <(free -m | awk '/^Mem:/ {print $2,$3,$4,$5}')
  ((total > 0)) || {
    echo "0MiB 0MiB 0"
    exit 0
  }
  echo "${used}MiB ${total}MiB $((100 * used / total))"
  ;;
swap)
  read -r total used free < <(free -m | awk '/^Swap:/ {print $2,$3,$4}')
  ((total > 0)) || {
    echo "0MiB 0MiB 0"
    exit 0
  }
  echo "${used}MiB ${total}MiB $((100 * used / total))"
  ;;
*) echo "0MiB 0MiB 0" ;;
esac
