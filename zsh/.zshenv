export XDG_CONFIG_HOME=$HOME/.config

# Add the scripts folder to the PATH
export PATH=$HOME/.local/scripts:$PATH

# To not start ryuk container when using python testcontainers
export TESTCONTAINERS_RYUK_DISABLED=true
. "$HOME/.cargo/env"

if [ -f "$HOME/.zsh_local" ]; then
    source "$HOME/.zsh_local"
fi
