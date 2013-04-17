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

# test xkbmap avant xkbcomp
setxkbmap -option terminate:ctrl_alt_bksp
xkbcomp -w9 lafayette.xkb $DISPLAY
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
synclient PalmDetect=1

# Disable Trackpad while Typing 
# syndaemon -t -k -i 2 -d &

# exec gnome-session
# exec startkde
#exec startxfce4
#exec ck-launch-session dbus-launch wmfs &
#exec wmfs &
#wmpid=$! # ici nous sauvegardons le PID de wmfs

#feh --bg-scale /path/to/your/wallpaper
#pcmanfm --desktop
#$HOME/.config/wmfs/status.sh

#wait $wmpid # ici on attend la fin de wmfs WMFS, quand l'utilisateur lance un : wmfs -c quit :(
exec i3
