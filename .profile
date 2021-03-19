##### PATH #####
export XDG_CONFIG_HOME="$HOME/.config"
export PATH=/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:~/.cabal/bin:/var/lib/flatpak/exports/share/applications
export PATH=$PATH:~/.cabal/bin
export SPICETIFY_INSTALL="$HOME/.spicetify-cli"
export PATH="$SPICETIFY_INSTALL:$PATH"
export PATH="$HOME/.telegram-palette-gen":$PATH
export XDEB_PKGROOT="$XDG_CONFIG_HOME/xdeb"
export PATH="$PATH:$HOME/.local/share/flutter/bin"
export GOPATH=$HOME/.go

# Startup

# Set vim as default editor
VIMRUNTIME=/usr/bin
EDITOR=/usr/bin/vim

# set PATH so it includes user's private ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

### PYWALL ###
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)
# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences
# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

##### START WM #####
if [[ "$(tty)" = "/dev/tty1" ]]; then
  pgrep xmonad || startx "$HOME/.xinitrc"
fi

eval "$(gh completion -s zsh)"
