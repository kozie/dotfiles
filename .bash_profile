# https://superuser.com/a/583502/225931
if [ -f /etc/profile ]; then
    if [ $(uname -s) = Darwin ]; then
        PATH=
    fi

    source /etc/profile
fi

# Execute brew paths and exports
eval "$(/opt/homebrew/bin/brew shellenv)"


. ~/.bashrc

export GPG_TTY=$(tty)
. "$HOME/.cargo/env"

. "$HOME/.local/bin/env"
