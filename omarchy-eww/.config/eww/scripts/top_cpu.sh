#!/usr/bin/env bash
# First line shows running/total processes to mimic your header context
procs=$(ps -e --no-headers | wc -l)
running=$(ps -e -o stat= | grep -c 'R')
printf "       %s / %s    (PID)  CPU%%     MEM%%\n" "$running" "$procs"
ps -eo comm,pid,pcpu,pmem --no-headers --sort=-pcpu | head -n 5 |
  awk '{printf "       %-18.18s %6s %6s %8s\n", $1, $2, $3, $4}'
