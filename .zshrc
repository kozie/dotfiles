PLATFORM=$(uname -s)
if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Theme
eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/zen.toml)"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Snippets
zinit snippet OMZL::git.zsh

# Load completions
autoload -Uz compinit && compinit

# Suggested by whatever..
zinit cdreplay -q

# Set Vi mode
bindkey -v
bindkey '^f' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
setopt NO_CASE_GLOB
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Exports
export BAT_THEME="base16"
export VISUAL="nvim"
export EDITOR="$VISUAL"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# FZF Settings
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_COMPLETION_TRIGGER='**'
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"

# Highlighting inside manpages and elsewhere
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Aliases
alias ls='ls --color'
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
alias va='PATH="$(brew --prefix php@8.2)/bin:$PATH" valet-plus'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

#alias ll="ls -lhaF"
#alias l="ls -lhaF"
#alias ls="eza --icons=always"
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
alias cake="valet php bin/cake.php"
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

alias vb="$EDITOR ~/.zshrc"
alias sb="exec zsh"
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

# BitBucket functions
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

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm

[ -f ~/.private.sh ] && . ~/.private.sh
