# zsh-history-substring-search
zinit ice wait'!'
zinit load zsh-users/zsh-history-substring-search

zinit ice wait lucid
zinit light zsh-users/zsh-completions

zinit ice wait lucid
zinit light zdharma-continuum/fast-syntax-highlighting

zinit ice wait lucid
zinit light zsh-users/zsh-autosuggestions

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
