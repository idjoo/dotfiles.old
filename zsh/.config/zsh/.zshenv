typeset -U PATH path

path+=("$HOME/.local/bin")
path+=("$HOME/.cargo/bin")
path+=("$path[@]")

export PATH

export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"
