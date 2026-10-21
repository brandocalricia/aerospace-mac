# AeroSpace, with a bit of Hyprland in it

This is the window setup from Brandon's Mac, `Brandons-MacBook-Air-3`.

The Mac uses [AeroSpace](https://github.com/nikitabobko/AeroSpace) to tile windows. The Fedora computers use Hyprland. This package makes the Mac closer to that Fedora desktop: same gaps, same gold frame, same rooms for the same apps, and a few extra keys.

Tested on AeroSpace **0.20.3-Beta** and borders **1.9.0**, macOS 15.6.1.

## What the Mac cannot copy

Hyprland slides, fades, and blurs windows because it draws them itself. AeroSpace asks macOS to place windows, and its author has said it will not add animations. These windows snap into place. The gold frame is round. The picture inside the window stays square.

## Keys

Option is the modifier. Command still copies, pastes, and switches apps.

| Keys | What happens |
| --- | --- |
| Option+Arrows | Move focus |
| Option+Shift+Arrows | Move the window |
| Option+1 … Option+9, Option+0 | Rooms 1–9, and room 10 |
| Option+Shift+number | Send the window to that room and follow it |
| Option+Q | Close |
| Option+F | Full screen, out to the edges |
| Option+V | Float or tile |
| Option+J | Side-by-side or top-and-bottom |
| Option+Minus / Option+Equal | Shrink or grow |
| Option+Comma | Deck of windows, with a small peek |
| Option+Tab | Jump back to the last room |
| Option+Enter | Terminal |
| Option+A | Nimble Commander |
| Option+B | Brave |
| Option+Shift+R | Reload this file |
| Option+Shift+Semicolon | A short "fix the layout" moment |

Inside that moment: arrows resize, Shift+arrows nests a window with its neighbor, B evens the windows, R flattens a messy nest, Escape leaves. Typing B in that moment evens windows instead of typing the letter.

## Rooms for new windows

A newly opened window goes to the same room it uses on Fedora. Windows already open stay where they are.

| App | Room |
| --- | --- |
| Brave | 2 |
| Obsidian | 4 |
| Spotify | 9 |
| Steam | 10 |

Dropbox's menu icon stays floating. An untitled Finder, Pages, Numbers, or Keynote window floats. A real document stays tiled.

## The gold frame

The frame is [JankyBorders](https://github.com/FelixKratz/JankyBorders) (`borders` 1.9.0). Focused windows get a gold gradient (`#c89412` to `#d4a13a`). Other windows get the dark red `#3d0d0a`. The line is 2 points and round. Same colors as the Fedora blackgold theme.

AeroSpace starts the frame. Do not also run `brew services start borders`, or you can get two starters.

Stopping `borders` does not stop AeroSpace.

## On this Mac

The live file is `~/dotfiles/aerospace/.aerospace.toml`. `~/.aerospace.toml` points at it. The scripts live in `~/dotfiles/scripts/`. `~/.config/borders/bordersrc` points at `aerospace-borders.sh`.

This repo is a public copy of that slice. Change the Mac first, then update this copy, so the two do not drift.

## If you use this on another Mac

1. Install AeroSpace.
2. Trust and install the frame:

```
brew tap FelixKratz/formulae
brew trust --formula felixkratz/formulae/borders
brew install borders
```

3. Put `aerospace.toml` where AeroSpace reads it (`~/.aerospace.toml`).
4. Put the scripts somewhere stable, and point the three `$HOME/dotfiles/scripts/...` lines at that place.
5. Point `~/.config/borders/bordersrc` at `aerospace-borders.sh`.
6. Run `aerospace reload-config`, then run `aerospace-borders.sh` once. The next login, AeroSpace starts the frame.

## When AeroSpace updates

The file sets `config-version = 2`. That is the newest generation 0.20.3-Beta understands. After an update, run:

```
aerospace reload-config
```

If reload warns that a newer config-version exists, the file still loaded. Read the [config-version guide](https://nikitabobko.github.io/AeroSpace/guide#config-version) before changing the number. Do not bump it just to clear the warning.

One unknown key makes AeroSpace reject the whole file. It keeps running the previous good file. This 0.20.3-Beta app does not know `auto-reload-config` or `focus-follows-mouse`. Leave them out until a doctor check says the app knows them.

`scripts/aerospace-doctor.sh` prints the version and the modes. It does not move windows or edit the file.

Room rules use `if.app-id`. This app has no `test` command. The AeroSpace author says the `if.app-id` shape should keep working.

A future Homebrew may ignore the AeroSpace tap until you trust that one cask:

```
brew trust --cask nikitabobko/tap/aerospace
```

Trust that cask only. Do not trust the whole tap.

## Leave these alone

- The callbacks stay at the top of the file, above `[gaps]`. Nested under gaps or under the key list, AeroSpace 0.20.3 refuses the file.
- Option stays the modifier.
- The Apple menu bar stays. AeroSpace already shows the room number on its menu icon.
