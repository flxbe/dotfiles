export XDG_CONFIG_HOME=$HOME/.config

export PATH=$HOME/.local/scripts:$PATH
export PATH=$HOME/zig_nightly:$PATH

export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"

export PATH=$HOME/.cargo/bin:$PATH

# For rootless docker
export PATH=/home/flxbe/bin:$PATH
export DOCKER_HOST=unix:///run/user/1000/docker.sock

