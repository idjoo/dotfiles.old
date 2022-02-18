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

if [ -d "$HOME/.local/bin" ] && (! echo $PATH | grep -q "$HOME/.local/bin"); then
    export PATH="$HOME/.local/bin:$PATH"
fi

# Statusbar loop
#while true; do
#   xsetroot -name "$( date +"%F %R" )"
#   sleep 1m    # Update time every minute
#done &

# setxkbmap -option caps:swapescape
xmodmap $HOME/.xmodmap
xcape -e 'Mode_switch=Escape'

xbacklight -set 50
xset s off
xset -dpms
mpd &

exec herbstluftwm --locked
