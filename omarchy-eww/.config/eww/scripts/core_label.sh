#!/usr/bin/env bash
# Prints the label "Core X" for the Nth "Core <num>:" line in sensors
ord="${1:-0}"
label=$(sensors 2>/dev/null | awk '/^Core [0-9]+:/{print $1,$2}' | sed -n "$((ord + 1))p")
# $1="Core", $2="N:" → strip trailing colon
echo "${label%:}"
