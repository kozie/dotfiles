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
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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
else
    [ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
    [ -f /usr/share/bash-completion/completions/git ] && . /usr/share/bash-completion/completions/git
fi

### Disable CTRL-S and CTRL-Q
[[ $- =~ i ]] && stty -ixoff -ixon

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.composer/vendor/bin"
#export PATH="/usr/local/opt/php@7.1/bin:$PATH"
#export PATH="/usr/local/opt/php@7.1/sbin:$PATH"
#export PATH="/usr/local/opt/valet-php@7.1/bin:$PATH"
#export PATH="/usr/local/opt/valet-php@7.1/sbin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

if [ "$PLATFORM" != Darwin ]; then
    export PATH="$PATH:$HOME/npm/bin"
    export NODE_PATH="$NODE_PATH:$HOME/npm/lib/node_modules"
fi

### man bash
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=
export HISTFILESIZE=
export HISTTIMEFORMAT="%Y/%m/%d %H:%M:%S:   "
[ -z "$TMPDIR" ] && TMPDIR=/tmp

# z
[ -f ~/z.sh ] && . ~/z.sh
[ -f /usr/local/etc/profile.d/z.sh ] && . /usr/local/etc/profile.d/z.sh

# Vars
export VISUAL="nvim"
export EDITOR="$VISUAL"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# FZF Settings
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_COMPLETION_TRIGGER='**'

# Aliases
alias v="$EDITOR"
alias vi="$EDITOR"
alias g='git'
alias co='git checkout'
alias cm='git commit'
alias add='git add'
alias push='git push'
alias pull='git pull'
alias fetch='git fetch'
alias st='git status -u'
alias dif='git diff -w'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias ls="ls"
alias ll="ls -lhaF"

alias s="rg --hidden --files-with-matches --fixed-strings --ignore-case"
alias f="rg --hidden --fixed-strings --ignore-case"
alias gr="grep -v grep | grep -i"

alias tmux="TERM=xterm-256color tmux -2"
alias tm="TERM=xterm-256-color tmux -2 new -s"
alias ta="TERM=xterm-256color tmux -2 a"
alias tas="TERM=xterm-256color tmux -2 a -t"
alias com="COMPOSER_MEMORY_LIMIT=-1 composer"
alias storm="open -a PhpStorm" # Seems to work better than pstorm somehow
alias chrome='open -a Google\ Chrome'
alias xd='valet xdebug';
alias caf='echo "Keeping system active. Press Ctrl + c to cancel."; caffeinate -i'

alias mr='magerun2'
alias mr1='magerun'
alias mc='magento-cloud'
alias cc='magerun2 cache:flush; date'
alias mag='bin/magento'
alias rmall='rm -rf pub/static/_cache; rm -rf pub/static/frontend; rm -rf var/view_preprocessed; rm -rf generated/code; echo Removed folders; magerun2 cache:flush; cowsay cache is cleaned on $(date)'
alias rmst='rm -rf pub/static/_cache; rm -rf pub/static/frontend; rm -rf var/view_preprocessed;  echo Removed static folders; magerun2 cache:clean layout block_html full_page; cowsay cache is cleaned on $(date)'
#alias crf="mr sys:cr:li | grep '*' | awk '{print \$2}' | fzf | xargs magerun2 sys:cr:run"
alias crl='magerun2 sys:cron:list'
alias cr='magerun2 sys:cron:run'

alias vb="$EDITOR ~/.bashrc"
alias sb="source ~/.bash_profile"

if [ "$PLATFORM" = Linux ]; then
    # apt-get install -y xclip
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
fi

fix () { v $1 && add $1; }
crf () { mr sys:cr:li | grep '*' | awk '{print $2}' | fzf --query=$1 | xargs magerun2 sys:cr:run; }

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
if [ "$PLATFORM" = Darwin ]; then
    complete -W "NSGlobalDomain" defaults
fi

# FZF alias completion (**<tab>)
complete -o bashdefault -o default -o nospace -F _fzf_path_completion g
complete -o bashdefault -o default -F _fzf_path_completion v
complete -o default -F _fzf_path_completion ll

# Enable tab completion for `g` by marking it as an alias for `git`
if type __git_complete &> /dev/null; then
    __git_complete g __git_main
fi;

# Git bash completions
__git_complete _git_commit cm
__git_complete _git_add add
__git_complete _git_push push
__git_complete _git_pull pull
__git_complete _git_fetch fetch
__git_complete _git_status st
__git_complete _git_diff dif
__git_complete _git_checkout co

# History completion (close to fish)
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

### Colored ls
if [ -x /usr/bin/dircolors ]; then
  eval "`dircolors -b`"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
elif [ "$PLATFORM" = Darwin ]; then
  alias ls='ls -G'
fi

# highlighting inside manpages and elsewhere
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Prompt
# --------------------------------------------------------------------

#if [ "$PLATFORM" = Linux ]; then
  #PS1="\[\e[1;38m\]\u\[\e[1;34m\]@\[\e[1;31m\]\h\[\e[1;30m\]:"
  #PS1="$PS1\[\e[0;38m\]\w\[\e[1;35m\]> \[\e[0m\]"
#else
  ### git-prompt
  __git_ps1() { :;}
  if [ -e ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
  fi
  #PS1='\[\e[34m\]\u\[\e[1;32m\]@\[\e[0;33m\]\h\[\e[35m\]:\[\e[m\]\w\[\e[1;30m\]$(__git_ps1)\[\e[1;31m\]> \[\e[0m\]'
  PS1='\[\e[34m\]\w\[\e[1;30m\]$(__git_ps1)\[\e[1;31m\] > \[\e[0m\]'
#fi

# Automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=3
