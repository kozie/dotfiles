export PLATFORM=$(uname -s)

### Append to the history file
shopt -s histappend

### Check the window size after each command ($LINES, $COLUMNS)
shopt -s checkwinsize

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Enable Vi mode
set -o vi

### Better-looking less for binary files
[ -x /usr/bin/lesspipe    ] && eval "$(SHELL=/bin/sh lesspipe)"

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Sorry, very MacOS centric here. :/
if  which brew > /dev/null; then
    # bash completion.
    if [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
        source "$(brew --prefix)/share/bash-completion/bash_completion";
    elif [ -f /usr/local/etc/profile.d/bash_completion.sh ]; then
        source /usr/local/etc/profile.d/bash_completion.sh;
    elif [ -f /etc/bash_completion ]; then
        source /etc/bash_completion;
    fi

    # homebrew completion
    source "$(brew --prefix)/etc/bash_completion.d/brew"
fi;

### Disable CTRL-S and CTRL-Q
[[ $- =~ i ]] && stty -ixoff -ixon

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="/usr/local/opt/php@7.1/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/sbin:$PATH"

### man bash
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=
export HISTFILESIZE=
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:   "
[ -z "$TMPDIR" ] && TMPDIR=/tmp

# z
. ~/z.sh

# Vars
export VISUAL="nvim"
export EDITOR="$VISUAL"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# FZF Settings
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# Aliases
alias v="$EDITOR"
alias vi="$EDITOR"
alias g='git'
alias co='git checkout'
alias cm='git commit'
alias add='git add'
alias push='git push'
alias pull='git pull'
alias st='git status'
alias dif='git diff -w'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias ls="ls"
alias ll="ls -laF"

alias s="rg --hidden --files-with-matches --fixed-strings --ignore-case"
alias f="rg --hidden --fixed-strings --ignore-case"

alias mr='magerun2'
alias mr1='magerun'
alias cc='magerun2 cache:flush; date'
alias mag='bin/magento'

alias vb="$EDITOR ~/.bashrc"
alias sb="source ~/.bash_profile"

# Git bash completions
complete -o default -o nospace -F _git_checkout co
complete -o default -o nospace -F _git_commit cm
complete -o default -o nospace -F _git_add add
complete -o default -o nospace -F _git_push push
complete -o default -o nospace -F _git_pull pull
complete -o default -o nospace -F _git_status st
complete -o default -o nospace -F _git_diff dif

# Enable tab completion for `g` by marking it as an alias for `git`
if type __git_complete &> /dev/null; then
    __git_complete g __git_main
fi;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

### Colored ls
if [ -x /usr/bin/dircolors ]; then
  eval "`dircolors -b`"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
elif [ "$PLATFORM" = Darwin ]; then
  alias ls='ls -G'
fi

# Prompt
# --------------------------------------------------------------------

if [ "$PLATFORM" = Linux ]; then
  PS1="\[\e[1;38m\]\u\[\e[1;34m\]@\[\e[1;31m\]\h\[\e[1;30m\]:"
  PS1="$PS1\[\e[0;38m\]\w\[\e[1;35m\]> \[\e[0m\]"
else
  ### git-prompt
  __git_ps1() { :;}
  if [ -e ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
  fi
  #PS1='\[\e[34m\]\u\[\e[1;32m\]@\[\e[0;33m\]\h\[\e[35m\]:\[\e[m\]\w\[\e[1;30m\]$(__git_ps1)\[\e[1;31m\]> \[\e[0m\]'
  PS1='\[\e[34m\]\w\[\e[1;30m\]$(__git_ps1)\[\e[1;31m\] > \[\e[0m\]'
fi
