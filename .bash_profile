# https://superuser.com/a/583502/225931
if [ -f /etc/profile ]; then
    if [ $(uname -s) = Darwin ]; then
        PATH=
    fi

    source /etc/profile
fi

. ~/.bashrc

export GPG_TTY=$(tty)
