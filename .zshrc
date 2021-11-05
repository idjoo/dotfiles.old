# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
# PS1="[%n@%m %~] "
#
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

plugins=(
    zsh-syntax-highlighting
    zsh-autosuggestions
    fzf-tab
    fzf
    vi-mode
    aws
    git
)

source $ZSH/oh-my-zsh.sh

# User configuration
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Fix kitty ssh
current_terminal="$(ps -p$PPID -o cmd=)"
if [[ $current_terminal =~ 'kitty' ]]; then
    alias ssh="kitty +kitten ssh";
fi

# pip zsh completion
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim'
else
    export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias FUCK)

# Alias
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias vim='nvim'
alias ls='lsd'
alias z='vifm -c za .'
alias x='htop'
alias f='toggle-fzf-tab'
alias scrcpy='scrcpy --render-driver=software'

# Remove mode switching delay.
KEYTIMEOUT=5

# fzf
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
export FZF_COMPLETION_OPTS='--border --info=inline'
_fzf_compgen_path() {

  fd --hidden --follow --exclude ".git" . "$1"
}
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

precmd_functions+=(_fix_cursor)

source ~/.profile
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias luamake=/home/cocatrip/lua-language-server/3rd/luamake/luamake

# save path on cd
function cd {
    builtin cd $@
    pwd > ~/.last_dir
}

# restore last saved path
if [ -f ~/.last_dir ]
    then cd `cat ~/.last_dir`
fi
