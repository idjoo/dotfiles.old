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

xmodmap $HOME/.xmodmap
xcape -e 'Mode_switch=Escape'
xbacklight -set 50
xset s off
xset -dpms
xset r rate 200 30

if [ $(ps aux | grep ssh-agent | wc -l) -eq 1 ]; then
  eval "$(ssh-agent -s)"
fi

# set wallpaper
# feh --bg-fill ~/Pictures/.wallpaper/*.png

export $(dbus-launch)

exec herbstluftwm --locked
