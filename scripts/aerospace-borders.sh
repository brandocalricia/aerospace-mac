#!/bin/bash
# Gold frame for AeroSpace, matching the Fedora blackgold Hyprland borders.
# Safe to run more than once: if a frame is already up, this only refreshes it.
# If `borders` is missing, exit quietly. Tiling does not depend on this script.
PATH="/opt/homebrew/bin:/usr/local/bin:${PATH}"
if ! command -v borders >/dev/null 2>&1; then
  exit 0
fi
exec borders \
  style=round \
  width=2.0 \
  hidpi=on \
  "active_color=gradient(top_left=0xffc89412,bottom_right=0xffd4a13a)" \
  inactive_color=0xff3d0d0a
