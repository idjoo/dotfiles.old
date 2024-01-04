#!/usr/bin/env zsh

alias z='lfrun'
alias x='btop'
alias ls='eza --group-directories-first --color=always --icons --git'
alias ll='eza -l'
alias la='eza -a'
alias {lla,lal}='eza -la'
alias rm='rm --verbose --interactive=once'
alias cp='cp --verbose'
alias du='du --human-readable --summarize'
alias k='kubectl'
alias lg='lazygit'
alias less='nvim +Man!'

alias explorer='/mnt/c/Windows/explorer.exe'

alias npp='/mnt/d/Applications/Scoop/apps/notepadplusplus/current/notepad++.exe'

alias keychain='keychain --dir "$XDG_RUNTIME_DIR"/keychain --absolute'

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

alias notes='nvim /mnt/d/Documents/NOTES.md'

alias so='source'

alias nc='ncat -v'
alias telnet='ncat -v'

alias ngl="npm-groovy-lint --config ~/.groovylintrc-recommended-jenkinsfile.json --format"

alias reload="source ${ZDOTDIR}/.zshrc"

alias s="stern --exclude='elastic|eureka|configservice|queue' --output=raw --timestamps=short"

alias pass='gopass'
