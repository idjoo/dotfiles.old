source $ZDOTDIR/zshenv
source $ZDOTDIR/zprofile
source $ZDOTDIR/zinit.zsh
source $ZDOTDIR/plugins.zsh
source $ZDOTDIR/functions.zsh
source $ZDOTDIR/alias.zsh
source $ZDOTDIR/zshrc
source $ZDOTDIR/zlogin
source $ZDOTDIR/zlogout

[[ "$(uname -o)" == "Android" ]] && source $ZDOTDIR/termux.zsh
