# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

fpath=( "$HOME/.oh-my-zsh/functions" $fpath )

# Load up pure
autoload -U promptinit; promptinit
prompt pure

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=""
#ZSH_THEME="kagnoster"

# Uncomment the following line to use case-sensitive completion.
#CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 #ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
export PATH=~/.npm-global/bin:$PATH

# Z !
source ~/code/z/z.sh

export CLICOLOR=1
#export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34:su=0:sg=0:tw=0:ow=0:"
export LSCOLORS=1
#export TERM=xterm-256color
export VISUAL="vim"
export EDITOR="$VISUAL"

# FZF !
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Shortcut for cd PATH && ls -al
cdl () { cd "$@" && ls -al --color=auto; }

# Shortcut for mkdir -p && cd
mkcd () { mkdir -p "$@" && cd "$@"; }

# Compress image using convert (imagemagick)
# optionally add -gaussian-blur 0.05
imgcomp() { convert -strip -interlace Plane -quality 85% $1 $2; }

# vim + ag + fzf = unlimited power! ⚡️
vag() { $EDITOR $(ag -Ql "$1" | fzf); }

# Bower install and bower-installer
bii() { bower install "$1" --save && bower-installer -r; }

# Git mergin made a bit easier
_git_qm() { __gitcomp_nl "$(__git_refs)"; }

# Load up external .priv.sh stuff
[ -f ~/.priv.sh ] && source ~/.priv.sh

alias v="$EDITOR"
alias vi="$EDITOR"

alias g='git'
alias co='git checkout'
alias cm='git commit'
alias add='git add'
alias push='git push'
alias pull='git pull'
alias fetch='git fetch'
alias merge='git merge --no-ff'
alias qmerge='git merge --no-edit --no-ff'
alias qm='git merge --no-edit --no-ff' # Same as previous
alias status='git status'
alias st='git status' # Same as previous
alias lol='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias lola='git log --graph --decorate --pretty=oneline --abbrev-commit --all'

alias tm="tmux new -s"
alias ta="tmux a"
alias tas="tmux a -t"

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias vizsh="vim ~/.zshrc && source ~/.zshrc"
alias ls="ls --color=auto"
alias ll="ls --color=auto -laF"

alias mr="n98-magerun"
alias mr2="n98-magerun2"
alias cc="mr cache:clean && mr cache:flush && date"
alias cc2="mr2 cache:clean && mr2 cache:flush && date"
alias phpm="php -d memory_limit=-1"

alias bi="bower install"
alias bs="bower search"

# Not sure if this is needed
# zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# The Fuck
#eval "$(thefuck --alias)"

# ZSH Syntax Highlighting
#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
