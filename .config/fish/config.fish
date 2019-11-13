# vi mode
#function fish_vi_cursor; end
fish_vi_key_bindings

# fzf settings
set -x FZF_LEGACY_KEYBINDINGS 1
set -x FZF_TMUX 1
set -x FZF_DEFAULT_OPTS '--height 40%'
set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# set PATH
set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/sbin $PATH
set -x PATH $PATH $HOME/.composer/vendor/bin
set -x PATH /usr/local/opt/valet-php@7.1/bin $PATH
set -x PATH /usr/local/opt/valet-php@7.1/sbin $PATH
set -x PATH /usr/local/opt/mysql@5.7/bin $PATH

# set MANPATH
#set -x MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH

# Z
#set -g Z_SCRIPT_PATH $HOME/code/z/z.sh

# Exports
set -x VISUAL nvim
set -x EDITOR $VISUAL
set -x LESS '-R' # Use colors with less

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
make_completion pull 'git pull'
make_completion push 'git push'
make_completion st 'git status'
make_completion dif 'git diff'
make_completion add 'git add'

function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end

function g     ; git $argv ; end

# aliases
function v      ; eval $EDITOR $argv; end
function vi     ; eval $EDITOR $argv; end

function add    ; git add $argv; end
function push   ; git push $argv; end
function pull   ; git pull $argv; end
function fetch  ; git fetch $argv; end
function merge  ; git merge --no-ff $argv; end
function qmerge ; git merge --no-edit --no-ff $argv; end
function st     ; git status $argv; end # Same as previous
function lol    ; git log --graph --decorate --pretty=oneline --abbrev-commit $argv; end
function lola   ; git log --graph --decorate --pretty=oneline --abbrev-commit --all $argv; end
function dif    ; git diff -w $argv; end

function tmux   ; env TERM=xterm-256color tmux -2 $argv; end
function tm     ; tmux new -s $argv; end
function ta     ; tmux a $argv; end
function tas    ; tmux a -t $argv; end

function com    ; composer $argv; end

function water  ; source ~/.config/fish/config.fish; end
function vish   ; eval $EDITOR ~/.config/fish/config.fish; and water; end # source ~/.config/fish/config.fish"
#function ls     ; command ls --color=auto $argv; end
function ll     ; ls -lhaF $argv; end
function ag     ; command ag --path-to-ignore ~/.agignore $argv; end

# Search (file) and find (in file) using ag
function s      ; rg --hidden --files-with-matches --fixed-strings --ignore-case $argv; end
function f      ; rg --hidden --fixed-strings --ignore-case $argv; end

function chrome ; open -a 'Google Chrome' "$argv"; end
function chroma ; open -na 'Google Chrome' --args "--app=$argv"; end
function calc   ; open -a "LibreOffice" --args "--calc" $argv; end

function mr     ; n98-magerun2 $argv; end
function phpm   ; php -d memory_limit=-1 $argv; end

function rmall  ; rm -rf pub/static/_cache; rm -rf pub/static/frontend; rm -rf var/view_preprocessed; rm -rf generated/code; echo Removed folders; magerun2 cache:flush; cowsay cache is cleaned on (date); end
function rmst   ; rm -rf pub/static/_cache; rm -rf pub/static/frontend; rm -rf var/view_preprocessed;  echo Removed static folders; magerun2 cache:clean layout block_html full_page; cowsay cache is cleaned on (date); end

# Readline colors
set -g fish_color_autosuggestion 555 yellow
set -g fish_color_command 5f87d7
set -g fish_color_comment 808080
set -g fish_color_cwd 87af5f
set -g fish_color_cwd_root 5f0000
set -g fish_color_error 870000 --bold
set -g fish_color_escape af5f5f
set -g fish_color_history_current 87afd7
set -g fish_color_host 5f87af
set -g fish_color_match d7d7d7 --background=303030
set -g fish_color_normal normal
set -g fish_color_operator d7d7d7
set -g fish_color_param 5f87af
set -g fish_color_quote d7af5f
set -g fish_color_redirection normal
set -g fish_color_search_match --background=purple
set -g fish_color_status 5f0000
set -g fish_color_user 5f875f
set -g fish_color_valid_path --underline

set -g fish_color_dimmed 555
set -g fish_color_separator 999

# Git prompt status
set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_showupstream auto
set -g pure_git_untracked_dirty false

# pure
set pure_threshold_command_duration 1
set pure_separate_prompt_on_error true
set pure_begin_prompt_with_current_directory false
set -U pure_color_success (set_color green)
set -U pure_color_git_dirty (set_color cyan)

# Status Chars
#set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_upstream_equal ''
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_dirtystate 'red'

set __fish_git_prompt_color_upstream_ahead ffb90f
set __fish_git_prompt_color_upstream_behind blue

# Local prompt customization
set -e fish_greeting


set -g fish_pager_color_completion normal
set -g fish_pager_color_description 555 yellow
set -g fish_pager_color_prefix cyan
set -g fish_pager_color_progress cyan


# highlighting inside manpages and elsewhere
set -gx LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
set -gx LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
set -gx LESS_TERMCAP_me \e'[0m'           # end mode
set -gx LESS_TERMCAP_se \e'[0m'           # end standout-mode
set -gx LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
set -gx LESS_TERMCAP_ue \e'[0m'           # end underline
set -gx LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

# load up extra (private) stuff
if test -e ~/.config/fish/extra.fish; source ~/.config/fish/extra.fish; end;
