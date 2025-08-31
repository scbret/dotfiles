#!/usr/bin/env bash
set -e

# 1) ensure daemon is running
eww daemon || true

# 2) wait until the daemon is ready
for i in {1..30}; do
  eww ping >/dev/null 2>&1 && break
  sleep 0.15
done

# 3) open panel; if it fails, reload once and try again
eww open conky_panel || {
  eww reload
  sleep 0.2
  eww open conky_panel
}
