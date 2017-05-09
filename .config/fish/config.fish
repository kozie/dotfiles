# vi mode
fish_vi_key_bindings

#function fish_mode_prompt; end
function fish_mode_prompt --description "Display the default mode for the prompt"
    # Do nothing if not in vi mode
    if test "$fish_key_bindings" = "fish_vi_key_bindings"
        or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
        switch $fish_bind_mode
            case default
                set_color --bold red 
                #echo '[N]'
                echo '⛔️'
            case insert
                set_color --bold green
                #echo '[I]'
                echo '🌸'
            case replace-one
                set_color --bold green
                #echo '[R]'
                echo '🔥'
            case visual
                set_color --bold magenta
                #echo '[V]'
                echo '⚡️'
        end
        set_color normal
        echo -n ' '
    end
end

# fzf settings
set -x FZF_LEGACY_KEYBINDINGS 1
set -x FZF_TMUX 1
set -x FZF_DEFAULT_OPTS '--height 40%'

# Go settings
set -x GOPATH $HOME/gohome

# set PATH
set -x PATH /usr/local/opt/go/libexec/bin $PATH
set -x PATH /usr/local/sbin $PATH
set -x PATH /usr/local/opt/coreutils/libexec/gnubin $PATH

# set MANPATH
set -x MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH

# Z
#set -g Z_SCRIPT_PATH $HOME/code/z/z.sh

# Exports
set -x VISUAL nvim
set -x EDITOR $VISUAL

# functions
function vag; ag -QUil "$argv" | fzf | read -l result; and eval $EDITOR $result; end
function fim; fzf | read -l result; and eval $EDITOR $result; end
function fzr; fzf | read -l result; and eval $argv $result; end
function cmp; git checkout $argv[1]; and pull; and git merge --no-ff --no-edit $argv[2]; and push; end

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
make_completion cmp 'git checkout'

function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

function g     ; git $argv ; end

# aliases
alias v "$EDITOR"
alias vi "$EDITOR"

alias vgs 'vagrant global-status'
alias up 'vagrant up'
alias down 'vagrant halt -f'
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

alias water "source ~/.config/fish/config.fish; and fish_user_key_bindings"
alias vish "$EDITOR ~/.config/fish/config.fish; and water" # source ~/.config/fish/config.fish"
alias vizsh "vish"
alias ls "command ls --color=auto"
alias ll "ls --color=auto -laF"
alias ag "ag --path-to-ignore ~/.agignore"

# Search (file) and find (in file) using ag
alias s "ag --path-to-ignore ~/.agignore -Quil"
alias f "ag --path-to-ignore ~/.agignore -Qui"

alias storm "open -a 'PhpStorm 2017.1 EAP'"

alias mr "n98-magerun"
alias mr2 "n98-magerun2"
alias cc "mr cache:clean; and mr cache:flush; and date"
alias cc2 "mr2 cache:flush; and date"
alias phpm "php -d memory_limit=-1"

# load up extra (private) stuff
if test -e ~/.config/fish/extra.fish; source ~/.config/fish/extra.fish; end;
