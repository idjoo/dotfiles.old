##### PATH #####
export XDG_CONFIG_HOME="$HOME/.config"
export PATH=/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin
export PATH=$PATH:~/.cabal/bin:/var/lib/flatpak/exports/share/applications

export GOPATH="$HOME/.go"
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

export PATH=$PATH:$HOME/.cargo/bin

export LLVM_CONFIG_PATH=/usr/lib/llvm/13/bin/llvm-config
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
. "$HOME/.cargo/env"
