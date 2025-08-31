#!/usr/bin/env bash
echo "       (PID)  MEM%     CPU%"
ps -eo comm,pid,pmem,pcpu --no-headers --sort=-pmem | head -n 5 |
  awk '{printf "       %-18.18s %6s %6s %8s\n", $1, $2, $3, $4}'
