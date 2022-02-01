if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    export PATH="$HOME/.local/bin:$PATH"
    exec startx
fi
