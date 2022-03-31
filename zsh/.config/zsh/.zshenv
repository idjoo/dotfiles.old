export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"

typeset -U PATH path

path+=("$HOME/.local/bin")
path+=("$HOME/.cargo/bin")
path+=("$HOME/.ICAClient/linuxx64")
path+=("$GOBIN")
path+=("$path[@]")

export PATH
