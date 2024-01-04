# zsh-history-substring-search
zinit ice wait'!'
zinit load zsh-users/zsh-history-substring-search

# minimal setup
zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions

# dircolors
zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
  atpull'%atclone' pick"clrs.zsh" nocompile'!' \
  atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS

# powerlevel10k
zinit ice depth"1"
zinit light romkatv/powerlevel10k

# fzf-marks
zinit ice wait lucid
zinit load urbainvaes/fzf-marks

# kubectl-aliases
zinit ice \
  atinit"sed -i -r 's/(kubectl.*) --watch/watch -n1 \\1/g' .kubectl_aliases" \
  pick".kubectl_aliases"
zinit light ahmetb/kubectl-aliases
