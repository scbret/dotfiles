#!/usr/bin/env bash
# Usage: cpu_avg.sh [SAMPLE_MS]
# Average CPU% (all cores), integer 0..100, with proper first-run handling.

win_ms="${1:-1000}"
state="/tmp/eww_cpu_all.stat"

read_all() {
  # line starts with "cpu " (aggregate)
  line=$(grep -E "^cpu\s" /proc/stat) || {
    echo "0 0"
    return
  }
  set -- $line
  # $1=cpu, $2.. = user nice system idle iowait irq softirq steal guest guest_nice
  user=${2:-0}
  nice=${3:-0}
  system=${4:-0}
  idle=${5:-0}
  iowait=${6:-0}
  irq=${7:-0}
  softirq=${8:-0}
  steal=${9:-0}
  guest=${10:-0}
  guestn=${11:-0}
  idle_all=$((idle + iowait))
  non_idle=$((user + nice + system + irq + softirq + steal + guest + guestn))
  total=$((idle_all + non_idle))
  echo "$idle_all $total"
}

if [[ ! -f "$state" ]]; then
  read -r i1 t1 < <(read_all)
  sleep "$(awk -v ms="$win_ms" 'BEGIN{printf "%.3f", ms/1000.0}')"
  read -r i2 t2 < <(read_all)
  echo "$i2 $t2" >"$state"
  dt=$((t2 - t1))
  di=$((i2 - i1))
else
  read -r ip tp <"$state"
  sleep "$(awk -v ms="$win_ms" 'BEGIN{printf "%.3f", ms/1000.0}')"
  read -r in tn < <(read_all)
  echo "$in $tn" >"$state"
  dt=$((tn - tp))
  di=$((in - ip))
fi

((dt <= 0)) && {
  echo 0
  exit 0
}
printf "%.0f\n" "$(awk -v dt="$dt" -v di="$di" 'BEGIN{u=(100.0*(dt-di))/dt; if(u<0)u=0; if(u>100)u=100; print u}')"
