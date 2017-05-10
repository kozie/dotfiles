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
# TODO change to functions to win a bunch of ms startup time!
function v      ; eval $EDITOR; end
function vi     ; eval $EDITOR; end

function vgs    ; vagrant global-status; end
function up     ; vagrant up; end
function down   ; vagrant halt -f; end
function vssh   ; vagrant ssh; end

function co     ; git checkout; end
function cm     ; git commit; end
function add    ; git add; end
function push   ; git push; end
function pull   ; git pull; end
function fetch  ; git fetch; end
function merge  ; git merge --no-ff; end
function qmerge ; git merge --no-edit --no-ff; end
function qm     ; git merge --no-edit --no-ff; end # Same as previous
function st     ; git status; end # Same as previous
function lol    ; git log --graph --decorate --pretty=oneline --abbrev-commit; end
function lola   ; git log --graph --decorate --pretty=oneline --abbrev-commit --all; end

function tm     ; tmux new -s; end
function ta     ; tmux a; end
function tas    ; tmux a -t; end

function water  ; source ~/.config/fish/config.fish; and fish_user_key_bindings; end
function vish   ; eval $EDITOR ~/.config/fish/config.fish; and water; end # source ~/.config/fish/config.fish"
function vizsh  ; vish; end
function ls     ; command ls --color=auto; end
function ll     ; ls --color=auto -laF; end
function ag     ; ag --path-to-ignore ~/.agignore; end

# Search (file) and find (in file) using ag
function s      ; ag --path-to-ignore ~/.agignore -Quil; end
function f      ; ag --path-to-ignore ~/.agignore -Qui; end

function storm  ; open -a 'PhpStorm 2017.1 EAP'; end

function mr     ; n98-magerun; end
function mr2    ; n98-magerun2; end
function cc     ; mr cache:clean; and mr cache:flush; and date; end
function cc2    ; mr2 cache:flush; and date; end
function phpm   ; php -d memory_limit=-1; end

# load up extra (private) stuff
if test -e ~/.config/fish/extra.fish; source ~/.config/fish/extra.fish; end;
