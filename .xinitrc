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
#syndaemon -t -k -i 2 -d &

xset -b

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
#synclient PalmDetect=1

#feh --bg-scale /path/to/your/wallpaper

#clipit &

#Start the udiskie service, before the window manager is loaded.
udiskie --tray &

xkbcomp -w9 ~/lafayette_linux_v0.5.xkb $DISPLAY

exec i3
