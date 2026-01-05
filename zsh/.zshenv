export XDG_CONFIG_HOME=$HOME/.config

export PATH=$HOME/.local/scripts:$PATH
export PATH=$HOME/zig:$PATH

export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/go/bin:$PATH

export PATH=$HOME/.local/bin:$PATH

# For rootless docker, only on linux
if [[ $(uname) != "Darwin" ]]; then
    export PATH=/home/flxbe/bin:$PATH
    export DOCKER_HOST=unix:///run/user/1000/docker.sock
fi

# To not start ryuk container when using python testcontainers
export TESTCONTAINERS_RYUK_DISABLED=true
. "$HOME/.cargo/env"

if [ -f "$HOME/.zsh_local" ]; then
    source "$HOME/.zsh_local"
fi
