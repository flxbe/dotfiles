export XDG_CONFIG_HOME=$HOME/.config

export PATH=$HOME/.local/scripts:$PATH
export PATH=$HOME/zig_nightly:$PATH

export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/go/bin:$PATH

export PATH="$PATH:/opt/nvim-linux64/bin"

# For rootless docker, only on linux
if [[ $(uname) != "Darwin" ]]; then
    export PATH=/home/flxbe/bin:$PATH
    export DOCKER_HOST=unix:///run/user/1000/docker.sock
fi

if [[ $(uname) == "Darwin" ]]; then
    echo 'PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
    eval $(/opt/homebrew/bin/brew shellenv)
fi

# To not start ryuk container when using python testcontainers
export TESTCONTAINERS_RYUK_DISABLED=true

. "$HOME/.cargo/env"
