#!/usr/bin/env bash
# Usage: cpu_core.sh INDEX
# Prints integer percent (0..100) for a single core, with proper first-run handling.

i="${1:-0}"
state="/tmp/eww_cpu_core_${i}.stat"

read_core() {
  local idx="$1"
  local line fields
  line=$(grep -E "^cpu${idx}\b" /proc/stat) || {
    echo "0 0"
    return
  }
  # shellcheck disable=SC2206
  fields=($line)
  # fields: cpuN user nice system idle iowait irq softirq steal guest guest_nice
  local user="${fields[1]:-0}"
  local nice="${fields[2]:-0}"
  local system="${fields[3]:-0}"
  local idle="${fields[4]:-0}"
  local iowait="${fields[5]:-0}"
  local irq="${fields[6]:-0}"
  local softirq="${fields[7]:-0}"
  local steal="${fields[8]:-0}"
  local guest="${fields[9]:-0}"
  local guest_nice="${fields[10]:-0}"

  local idle_all=$((idle + iowait))
  local non_idle=$((user + nice + system + irq + softirq + steal + guest + guest_nice))
  local total=$((idle_all + non_idle))
  echo "$idle_all $total"
}

if [[ ! -f "$state" ]]; then
  # First run: take two snapshots to get a real delta
  read -r idle1 total1 < <(read_core "$i")
  sleep 0.5
  read -r idle2 total2 < <(read_core "$i")
  echo "$idle2 $total2" >"$state"
  dt=$((total2 - total1))
  di=$((idle2 - idle1))
else
  read -r idle_prev total_prev <"$state"
  read -r idle_now total_now < <(read_core "$i")
  echo "$idle_now $total_now" >"$state"
  dt=$((total_now - total_prev))
  di=$((idle_now - idle_prev))
fi

((dt <= 0)) && {
  echo 0
  exit 0
}
usage=$(((100 * (dt - di)) / dt))
((usage < 0)) && usage=0
((usage > 100)) && usage=100
echo "$usage"
