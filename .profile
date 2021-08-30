##### PATH #####
export XDG_CONFIG_HOME="$HOME/.config"
export PATH=/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:~/.cabal/bin:/var/lib/flatpak/exports/share/applications
export GOPATH="$HOME/.go"

# Startup

# Set vim as default editor
export EDITOR="nvim"
export VISUAL="nvim"

# set PATH so it includes user's private ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

##### START WM #####
if [[ "$(tty)" = "/dev/tty1" ]]; then
  pgrep qtile || startx "$HOME/.xinitrc"
fi

# eval "$(gh completion -s zsh)"
