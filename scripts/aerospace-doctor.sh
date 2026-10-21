#!/bin/bash
# Read-only check. Does not reload, move windows, or edit the config.
# Run this after an AeroSpace update.
PATH="/opt/homebrew/bin:/usr/local/bin:${PATH}"
toml="${HOME}/dotfiles/aerospace/.aerospace.toml"
fail=0

echo "AeroSpace:"
if ! aerospace --version; then
  echo "aerospace is not on PATH"
  exit 1
fi

echo
echo "Config file: ${toml}"
if [[ ! -f "${toml}" ]]; then
  echo "missing config file"
  exit 1
fi

if grep -E '^[[:space:]]*(auto-reload-config|focus-follows-mouse)([[:space:]]|=)' "${toml}" >/dev/null; then
  echo "This installed app does not know auto-reload-config or focus-follows-mouse."
  echo "An unknown key makes AeroSpace reject the whole file. Remove that line."
  fail=1
fi

echo
echo "Modes the running app reports:"
if ! aerospace list-modes; then
  echo "The AeroSpace app did not answer. The menu-bar app may be quit."
  fail=1
fi

echo
echo "If reload ever warns that a newer config-version exists, the file still loaded."
echo "Read https://nikitabobko.github.io/AeroSpace/guide#config-version before changing the number."
echo "The gold frame is a separate app. Stopping borders does not stop AeroSpace."
exit "${fail}"
