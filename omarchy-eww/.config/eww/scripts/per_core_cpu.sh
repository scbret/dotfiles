#!/usr/bin/env bash
# Outputs per-core CPU percentages space-separated (up to 12 cores)
n=$(nproc 2>/dev/null)
[ -z "$n" ] && n=1
n=$((n > 12 ? 12 : n))
readarray -t a < <(grep '^cpu[0-9]' /proc/stat | head -n "$n")
totals=()
idles=()
for line in "${a[@]}"; do
  set -- $line
  idle=$5
  total=0
  for v in ${@:2}; do total=$((total + v)); done
  totals+=("$total")
  idles+=("$idle")
done
sleep 0.5
readarray -t b < <(grep '^cpu[0-9]' /proc/stat | head -n "$n")
out=()
for i in $(seq 0 $((n - 1))); do
  set -- ${b[$i]}
  idle2=$5
  total2=0
  for v in ${@:2}; do total2=$((total2 + v)); done
  dt=$((total2 - totals[$i]))
  di=$((idle2 - idles[$i]))
  [ $dt -le 0 ] && dt=1
  pct=$((100 * (dt - di) / dt))
  out+=("$pct")
done
printf "%s\n" "${out[*]}"
