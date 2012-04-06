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

dir=$HOME/.dotfiles

# Load files
files=( bash_ps1 bash_completion bash_functions git_completion git_flow_completion bash_aliases )
for file in ${files[@]}; do
  file="$dir/$file"
  [ -e "$file" ] && source "$file"
done

# For some reason is not working on Linux. 
# I added this condition to avoid errors.
if [[ `uname` == "Darwin"  ]]; then
  bind -f $dir/bash_bindings
fi

# Autocomplete for 'g' as well
complete -o default -o nospace -F _git g
complete -o default -o nospace -F _git_add ga
complete -o default -o nospace -F _git_checkout gco
complete -o default -o nospace -F _git_diff gd
complete -o default -o nospace -F _git_branch gb

export PATH="\
/usr/local/bin:\
$dir/bin:\
/opt/local/bin:\
/usr/local/lib/node:\
/usr/local/mysql/bin:\
/opt/local/lib/postgresql84/bin:\
$PATH:\
"&>/dev/null

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
export NODE_PATH="/usr/local/lib/node"

# load RVM
if [ -s "$HOME/.rvm/scripts/rvm" ]; then
  source "$HOME/.rvm/scripts/rvm"
  rvm load-rvmrc
fi

# Put secret configuration settings in ~/.secrets
if [ -s ~/.secrets ]; then
  source ~/.secrets
fi

# load rbenv
if [ -d "$HOME/.rbenv/bin" ]; then
  eval "$(rbenv init -)"
fi
