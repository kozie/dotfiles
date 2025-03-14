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
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(fzf --bash)"

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
export PATH=$HOME/.local/bin:$PATH
export PATH="$PATH:$HOME/.composer/vendor/bin"

# Composer vendor/bin in local project root
export PATH="vendor/bin:${PATH}"

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

# Sync history on each session
export PROMPT_COMMAND="history -a; history -n"

export BAT_THEME="base16"

# z
[ -f ~/z.sh ] && . ~/z.sh
[ -f /opt/homebrew/etc/profile.d/z.sh ] && . /opt/homebrew/etc/profile.d/z.sh
[ -f /usr/local/etc/profile.d/z.sh ] && . /usr/local/etc/profile.d/z.sh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# Vars
export VISUAL="nvim"
export EDITOR="$VISUAL"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# FZF Settings
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_COMPLETION_TRIGGER='**'
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"

# Aliases
alias v="$EDITOR"
alias vi="$EDITOR"
alias r='ranger'
alias g='git'
alias co='git checkout'
alias cm='git commit'
alias add='git add'
alias push='git push'
alias pull='git pull'
alias fetch='git fetch'
alias st='git status -u'
alias dif='git diff -w'
alias va='PATH="$(brew --prefix php@8.2)/bin:$PATH" valet-plus'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

#alias ls="ls"
#alias ll="ls -lhaF"
#alias l="ls -lhaF"
alias ls="eza --icons=always"
alias l="eza --icons=always -la"
alias ll="eza --icons=always -lag"
alias lt="eza --icons=always -lag --tree --level=3"
alias ltr="eza --icons=always -la --sort=modified"

alias s="rg --hidden --files-with-matches --fixed-strings --ignore-case"
alias f="rg --hidden --fixed-strings --ignore-case"
alias gr="grep -v grep | grep -i"

alias tmux="xTERM=xterm-256color tmux -2"
alias tm="xTERM=xterm-256color tmux -2 new -s"
alias ta="xTERM=xterm-256color tmux -2 a"
alias tas="xTERM=xterm-256color tmux -2 a -t"
alias com="COMPOSER_MEMORY_LIMIT=-1 composer"
alias vcom="COMPOSER_MEMORY_LIMIT=-1 valet composer"
alias vphp="valet php"
alias dr="valet php vendor/bin/drush"
alias np="nvm exec npm"
alias storm="open -a PhpStorm" # Seems to work better than pstorm somehow
alias chrome='open -a Google\ Chrome'
alias arc="open -a Arc"
alias firefox='open -a Firefox'
alias oo='open -a LibreOffice'
alias xd='valet-plus xdebug';
alias caf='echo "Keeping system active. Press Ctrl + c to cancel."; caffeinate -i'
alias randhash="head -n 4096 /dev/urandom | openssl sha1 | tr -d '\n'"
alias randpass="openssl rand -base64 32"

alias p='pbpaste'
alias c='pbcopy'

# Tool & Project specifics
alias dyndb='dynamodb-local -sharedDb'

alias vb="$EDITOR ~/.bashrc"
alias sb="source ~/.bash_profile"
alias vhost="sudo nvim /etc/hosts"

alias gd='git co env/development'
alias gt='git co env/test'
alias ga='git co env/acceptance'
alias gp='git co env/production'

alias setesc='sudo hidutil property --set '"'"'{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000064,"HIDKeyboardModifierMappingDst":0x700000029}]}'"'"''
alias dismouseacc='defaults write .GlobalPreferences com.apple.mouse.scaling -1'
alias ip='curl -vs -4 ifcfg.me/ip 2>&1 | tail -n1 | pbcopy'

if [ "$PLATFORM" = Linux ]; then
    # apt-get install -y xclip
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
fi

dssh () {
    docker exec –it "$1" /bin/bash
}

gip () {
    ping -c 1 "$1" | grep '64 bytes' | cut -d' ' -f4 | cut -d':' -f1;
}

csr () {
    if [[ $# -eq 0 ]]; then
        echo "Usage: csr example.com";
        return;
    fi

    mkdir -p ~/Certificates

    openssl req -new -newkey rsa:2048 -nodes -keyout ~/Certificates/${1}.key -out ~/Certificates/${1}.csr
}

# Open bitbucket page
bb () {
    xtmpremote=$(git remote -v | head -1 | sed "s/.*:\(.*\)\.git.*/\1/");

    if [[ -n ${xtmpremote} ]]; then
        open "https://bitbucket.org/$xtmpremote/$1" > /dev/null;
    else
        echo "Not found remote";
    fi
}

alias bpl="bb addon/pipelines/home"
alias bpr="bb pull-requests/new?dest=env/test"


accounts () {
    if [[ $# -eq 0 ]]; then
        echo "Please give a username";
        return;
    fi

    username=${1};
    pubdir=${2:-web};
    testurl=${3:-"${username}-test.republic-m.com"};
    accurl=${4:-"${username}-acceptance.republic-m.com"};

    echo "Enter Bitbucket pubkey: ";
    read pubkey;

    echo "
Generate bash:

adduser --quiet --shell /bin/bash --disabled-password --gecos "user" ${username}_test;
adduser --quiet --shell /bin/bash --disabled-password --gecos "user" ${username}_acc;
mkdir -p /home/${username}_{test,acc}/{$pubdir,.ssh};
echo '$pubkey' > /home/${username}_{test,acc}/.ssh/authorized_keys;
chown -R ${username}_test:${username}_test /home/${username}_test/{$pubdir,.ssh};
chown -R ${username}_acc:${username}_acc /home/${username}_acc/{$pubdir,.ssh};
chmod 0600 /home/${username}_{test,acc}/.ssh/authorized_keys;
echo '<?php echo \"${username}_test\";' > /home/${username}_test/$pubdir/index.php;
echo '<?php echo \"${username}_acc\";' > /home/${username}_acc/$pubdir/index.php;
echo \"<VirtualHost *:80>
    ServerName $testurl
    ServerAdmin webmaster@localhost
    DocumentRoot /home/${username}_test/$pubdir
    <Directory "/home/${username}_test/$pubdir">
       Options Indexes FollowSymLinks MultiViews
       Allowoverride All
       Require all granted
    </Directory>

    ErrorLog \\\${APACHE_LOG_DIR}/error.log
    CustomLog \\\${APACHE_LOG_DIR}/access.log combined
</VirtualHost>\" > /etc/apache2/sites-available/$testurl.conf;
a2ensite $testurl;
echo \"<VirtualHost *:80>
    ServerName $accurl
    ServerAdmin webmaster@localhost
    DocumentRoot /home/${username}_acc/$pubdir
    <Directory "/home/${username}_acc/$pubdir">
       Options Indexes FollowSymLinks MultiViews
       Allowoverride All
       Require all granted
    </Directory>

    ErrorLog \\\${APACHE_LOG_DIR}/error.log
    CustomLog \\\${APACHE_LOG_DIR}/access.log combined
</VirtualHost>\" > /etc/apache2/sites-available/$accurl.conf;
a2ensite $accurl;";
}

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
if [ "$PLATFORM" = Darwin ]; then
    complete -W "NSGlobalDomain" defaults
fi

# FZF alias completion (**<tab>)
complete -o bashdefault -o default -o nospace -F _fzf_path_completion g
complete -o bashdefault -o default -F _fzf_path_completion v
complete -o default -F _fzf_path_completion ll
complete -o default w

# Composer and php completions (also valet)
complete -F _complete_alias com
complete -F _complete_alias vcom
complete -F _complete_alias vphp

# Enable tab completion for `g` by marking it as an alias for `git`
if type __git_complete &> /dev/null; then
    __git_complete g __git_main
fi;

# Git bash completions
__git_complete cm _git_commit
__git_complete add _git_add
__git_complete push _git_push
__git_complete pull _git_pull
__git_complete fetch _git_fetch
__git_complete st _git_status
__git_complete dif _git_diff
__git_complete co _git_checkout

# History completion (close to fish)
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

### Colored ls
### jan 2025: Replace in favour of eza.
#if [ -x /usr/bin/dircolors ]; then
#  eval "`dircolors -b`"
#  alias ls='ls --color=auto'
#  alias grep='grep --color=auto'
#elif [ "$PLATFORM" = Darwin ]; then
#  alias ls='ls -G'
#fi

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

# Init Starship prompt!
eval "$(starship init bash)"

# Load custom stuff
[ -f ~/.private.sh ] && . ~/.private.sh
[ -f ~/fzf-git.sh ] && . ~/fzf-git.sh
