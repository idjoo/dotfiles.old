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

# Statusbar loop
while true; do
   xsetroot -name "$( date +"%F %R" )"
   sleep 1m    # Update time every minute
done &

setxkbmap -option caps:swapescape
xrdb .Xresources
xsetroot -cursor_name left_ptr &
xbacklight -set 50
nitrogen --restore &

# exec dbus-launch --sh-syntax --exit-with-session qtile
exec dwm
