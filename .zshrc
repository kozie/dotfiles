# Path to your oh-my-zsh installation.
export ZSH=/Users/koos/.oh-my-zsh

fpath=( "$HOME/.oh-my-zsh/functions" $fpath )

# Load up pure
autoload -U promptinit; promptinit
prompt pure

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pure"
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Required for Dingy and Docker
#eval $(dinghy env)

# Core utils (brew install coreutils)
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/sbin:$PATH:$HOME/.rvm/bin"
export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"

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

# Compress image using convert (imagemagick)
# optionally add -gaussian-blur 0.05
imgcomp() { convert -strip -interlace Plane -quality 85% $1 $2; }

# cssh
cssh() { ssh root@web$1.cream.nl -t "cd /home/$2/domains; su $2; exec \$SHELL -l"; }

# vim + ag + fzf = unlimited power! ⚡️
vag() { $EDITOR $(ag -Ql "$1" | fzf); }

alias v="$EDITOR"
alias vi="$EDITOR"

alias vgs='vagrant global-status'
alias up='vagrant up'
alias down='vagrant halt'
alias vssh='vagrant ssh'

alias g='git'
alias co='git checkout'
alias cm='git commit'
alias add='git add'
alias push='git push'
alias pull='git pull'
alias fetch='git fetch'
alias merge='git merge'
alias qmerge='git merge --no-edit'
alias status='git status'
alias lol='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias lola='git log --graph --decorate --pretty=oneline --abbrev-commit --all'

alias tm="tmux new -s"
alias ta="tmux a"
alias tas="tmux a -t"

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias vizsh="vim ~/.zshrc && source ~/.zshrc"
alias ls="ls --color=auto"

alias storm="open -a PhpStorm"
alias love="open -n -a love"
alias mr="n98-magerun"

# Not sure if this is needed
# zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# The Fuck
eval "$(thefuck --alias)"

# ZSH Syntax Highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Custom MOTD - The hacky way
fortune | cowsay

export PATH="$HOME/.yarn/bin:$PATH"
