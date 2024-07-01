export XDG_CONFIG_HOME=$HOME/.config

export PATH=$HOME/.local/scripts:$PATH
export PATH=$HOME/zig_nightly:$PATH

export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/go/bin:$PATH

# For rootless docker, only on linux
if [[ $(uname) != "Darwin" ]]; then
    export PATH=/home/flxbe/bin:$PATH
    export DOCKER_HOST=unix:///run/user/1000/docker.sock
fi

