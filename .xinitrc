#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# disable touchpad while typing
syndaemon -t -k -i 2 -d &

xset -b

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
synclient PalmDetect=1

#feh --bg-scale /path/to/your/wallpaper

#Start the udiskie service, before the window manager is loaded.
udiskie --tray &

exec i3
