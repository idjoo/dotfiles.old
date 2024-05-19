#!/usr/bin/env zsh

alias x='btop'
alias ls='eza --group-directories-first --color=always --icons --git'
alias ll='eza --long --group'
alias la='eza --all'
alias {lla,lal}='eza --long --all --group'
alias rm='rm --verbose --interactive=once'
alias cp='cp --verbose'
alias du='du --human-readable --summarize'
alias k='kubectl'
alias lg='TERM=xterm-256color lazygit'
alias less='nvim +Man!'

alias explorer='/mnt/c/Windows/explorer.exe'

alias npp='/mnt/d/Applications/Scoop/apps/notepadplusplus/current/notepad++.exe'

if command -v keychain 1>/dev/null 2>/dev/null; then
  alias keychain='keychain --dir "$XDG_RUNTIME_DIR"/keychain --absolute'
fi

alias update='git add *; git commit -m "update"; git push'

alias kc='kubie ctx'
alias kn='kubie ns'

alias v='nvim'

alias gs='git status'
alias ga='git add'
alias gr='git reset HEAD -- '
alias gc='git commit'
alias gp='git pull && git push --force-with-lease'
alias gpl='git pull'
alias gps='git push'

alias telnet='~/.local/bin/telnet'

alias notes='nvim ~/note.md'

alias so='source'

alias ngl="npm-groovy-lint --config ~/.groovylintrc-recommended-jenkinsfile.json --format"

alias reload="source ${ZDOTDIR}/.zshrc"

alias s="stern"
alias sf="stern --no-follow=false"

alias c="bat --paging=never"

alias adb='HOME="$XDG_DATA_HOME"/android adb'

alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

alias 7z-ultra='7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on'

# alias peaclock="peaclock --config-dir ~/.config/peaclock"
