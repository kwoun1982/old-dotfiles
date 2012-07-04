#!/bin/bash

set match-hidden-files off
set page-completions off
set completion-query-items 350

# set big history file 
export HISTSIZE=100000
export HISTFILESIZE=500000

# Now bash writes and re-reads the history file every time it prints a new prompt for you.
export PROMPT_COMMAND="history -a ; history -n;  ${PROMPT_COMMAND}"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# no duplicates in bash history and ignore same sucessive entries. 
export HISTCONTROL=ignoredups:erasedups
export HISTIGNORE="l[sla]:rm:mv:mkdir:cd:[bf]g:exit:logout"
# append to the history file, don't overwrite it
shopt -s histappend >/dev/null 2>&1

# PROMPT {{{

BRANCH="\$(git branch 2>/dev/null | grep -e '\*' | sed 's/^..\(.*\)/\\[\\033[45;30m\\]\\[⭠ \\]\1 \\[\\033[42;35m\\]⮀/')"

PS1="\n${BRANCH}\[\033[42;30m\] \u ⮁ \h \[\033[47;32m\]⮀\[\033[47;30m\] \w \[\033[49;37m\]⮀\[\033[49;37m\]\n\n\[\033[40;1;33m\] ⚡ \[\033[49;0;30m\]⮀\[\033[49;37m\] "
PS2="\[\033[40;1;33m\] ❯ \[\033[49;0;30m\]⮀\[\033[49;37m\] "

# }}}

dir=$HOME/.dotfiles

# Load files
files=(git_completion bash_functions bash_aliases )
for file in ${files[@]}; do
  file="$dir/$file"
  [ -e "$file" ] && source "$file"
done

bind -f $dir/bash_bindings

# Autocomplete for 'g' as well
complete -o default -o nospace -F _git g
complete -o default -o nospace -F _git_add ga
complete -o default -o nospace -F _git_checkout gco
complete -o default -o nospace -F _git_diff gd
complete -o default -o nospace -F _git_branch gb

# some settings to be more colorful
export CLICOLOR=1
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=true
export LSCOLORS=ExGxFxdxCxDxDxBxBxExEx

# use Vim as default editor
export EDITOR="vim"
export VISUAL=$EDITOR

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"

export LESS="-R"
[[ -z $DISPLAY ]] && export DISPLAY=":0.0"

export PATH=$PATH:$dir/bin
# Customize to your needs...

# Put secret configuration settings in ~/.secrets
if [ -s ~/.secrets ]; then
  source ~/.secrets
fi

export PATH="\
/usr/local/bin:\
/usr/local/share/python:\
$dir/bin:\
/opt/local/bin:\
/usr/local/lib/node:\
/usr/local/mysql/bin:\
/usr/games/bin:\
/opt/local/lib/postgresql84/bin:\
$PATH:\
"&>/dev/null
