# vi mode
fish_vi_key_bindings
function fish_mode_prompt; end

# fzf settings
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_TMUX 1

# set PATH
set -x PATH /usr/local/sbin $PATH
set -x PATH (brew --prefix coreutils)/libexec/gnubin $PATH

# set MANPATH
set -x MANPATH (brew --prefix coreutils)/libexec/gnuman $MANPATH

# Z
set -g Z_SCRIPT_PATH $HOME/code/z/z.sh

# Exports
set -x VISUAL vim
set -x EDITOR $VISUAL

# functions
function vag; $EDITOR (ag -Ql $args | fzf); end

# Completions
function make_completion --argument-names alias command
    echo "
    function __alias_completion_$alias
        set -l cmd (commandline -o)
        set -e cmd[1]
        complete -C\"$command \$cmd\"
    end
    " | .
    complete -c $alias -a "(__alias_completion_$alias)"
end

make_completion g 'git'
make_completion merge 'git merge'
make_completion qmerge 'git merge'
make_completion co 'git checkout'
make_completion pull 'git pull'
make_completion push 'git push'

function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

function g     ; git $argv ; end

# aliases
alias v "$EDITOR"
alias vi "$EDITOR"

alias vgs 'vagrant global-status'
alias up 'vagrant up'
alias down 'vagrant halt'
alias vssh 'vagrant ssh'

alias co 'git checkout'
alias cm 'git commit'
alias add 'git add'
alias push 'git push'
alias pull 'git pull'
alias fetch 'git fetch'
alias merge 'git merge --no-ff'
alias qmerge 'git merge --no-edit --no-ff'
alias qm 'git merge --no-edit --no-ff' # Same as previous
#alias status 'git status'
alias st 'git status' # Same as previous
alias lol 'git log --graph --decorate --pretty=oneline --abbrev-commit'
alias lola 'git log --graph --decorate --pretty=oneline --abbrev-commit --all'

alias tm "tmux new -s"
alias ta "tmux a"
alias tas "tmux a -t"

alias vizsh "vim ~/.config/fish/config.fish; and source ~/.config/fish/config.fish"
alias vish "vim ~/.config/fish/config.fish; and source ~/.config/fish/config.fish"
alias ls "command ls --color=auto"
alias ll "ls --color=auto -laF"

alias storm "open -a 'PhpStorm 2017.1 EAP'"

alias mr "n98-magerun"
alias mr2 "n98-magerun2"
alias cc "mr cache:clean; and mr cache:flush; and date"
alias cc2 "mr2 cache:flush; and date"
alias phpm "php -d memory_limit=-1"

# load up extra (private) stuff
if test -e ~/.config/fish/extra.fish; source ~/.config/fish/extra.fish; end;
