# My beloved config
## How to install
```
curl https://raw.githubusercontent.com/YannMoisan/dotfiles/master/scripts/setup | bash -s linux
```

## Software
- window manager : [i3](https://wiki.archlinux.org/index.php/i3)
- terminal : [urxvt](https://wiki.archlinux.org/index.php/Rxvt-unicode)
- shell : [zsh](https://wiki.archlinux.org/index.php/zsh) with [prezto](https://github.com/sorin-ionescu/prezto)

## Keyboard shortcuts
### i3
|shortcut|description|
|---|---|
|Super+Enter|open a terminal|
|Super+[hjkl]|focus window|
|Super+Shift+[hjkl]|move focus window|
|Super+[asdf]|switch between mode|
|Super+[ui]|prev/next workspace|
|Super+[r]|reload|
|Super+Shift+Backspace|restart|
|Super+Ctrl+Backspace|exit|
|Super+o|split v|
|Super+Shift+o|split h|

### urxvt

|shortcut|description|
|---|---|
|Ctrl+Alt+C|Copy to clipboard|
|Ctrl+Alt+V|Paste from clipboard|
|Ctrl+[↓↑]|increase/decrease font size|
|Ctrl+=|back to default size|
|Ctrl+/|display current font in a pop-up|
|Ctrl+Delete|open last url in a browser|
|Alt+Delete|list url in a pop-up|

### tmux
|shortcut|description|
|---|---|
|ctrl+b ?|help|
|ctrl+b [pn]|prev/next window|

## Useful command for configuring X/i3
- `xset` : user preference utility for X (bip, DPMS)
- `xset q` : display current settings
- `xprop` : property displayer for X (get window class for i3 config)
- `xev` : print contents of X events (get keycodes for i3 config)
- `xinput` : utility to configure and test X input devices (touchpad, …)
- `xinput list` : list all the input devices
- `fc-list` : list available fonts

## Troubleshooting
A script `scripts/check` displays useful pieces of information to help you spot the issue.

## Thanks to
- [Kaze's dotfiles](https://github.com/fabi1cazenave/dotFiles/) - My dotfiles are based on this awesome work !
- [dotfiles.github.io](https://dotfiles.github.io/) - good to read if you want to store your dotfiles on github
