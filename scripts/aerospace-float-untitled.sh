#!/bin/bash
# Float a window AeroSpace just detected, but only if it is still untitled
# a moment later. Menu-bar and helper windows (Dropbox tray, Finder and
# iWork untitled windows) never get a title and otherwise take a tile.
# A real document has a title by the time we look, so it stays tiled.
id="${AEROSPACE_WINDOW_ID:-}"
[ -n "$id" ] || exit 0
sleep 0.6
line=$(aerospace list-windows --all --format '%{window-id} %{app-bundle-id} %{window-title}' 2>/dev/null \
  | awk -v id="$id" '$1 == id { print; exit }')
[ -n "$line" ] || exit 0
bundle=$(printf '%s\n' "$line" | awk '{ print $2 }')
title=$(printf '%s\n' "$line" | awk '{ $1=""; $2=""; sub(/^  /, ""); print }')
case "$bundle" in
  com.apple.finder|com.apple.iWork.Pages|com.apple.iWork.Numbers|com.apple.iWork.Keynote)
    ;;
  *)
    exit 0
    ;;
esac
[ -n "$title" ] && exit 0
aerospace layout floating --window-id "$id" >/dev/null 2>&1 || true
