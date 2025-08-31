#!/usr/bin/env bash
# Best-effort: show first CPU core temp if available
sensors 2>/dev/null | awk '/Core [0-9]+:/ {print $3; exit}' | tr -d '+'
