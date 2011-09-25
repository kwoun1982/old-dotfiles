#!/bin/bash

uptime

export PATH="\
$PATH:\
$HOME/.dot/bin:\
/usr/local/bin:\
/opt/local/bin:\
/usr/local/pgsql/bin:\
/usr/local/mysql/bin:\
/usr/local/Cellar/postgresql/9.0.4/bin/"\
&>/dev/null

# some settings to be more colorful
export CLICOLOR=1
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=true
export LSCOLORS=ExGxFxdxCxDxDxBxBxExEx

# use Vim as default editor
export EDITOR="vim"
export VISUAL=$EDITOR

# no duplicates in bash history and ignore same sucessive entries. 
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
export HISTIGNORE="l[sla]:rm:mv:mkdir:cd:[bf]g:exit:logout"
#export HISTIGNORE="&:[ ]*:exit"

export HISTSIZE=100000
export HISTFILESIZE=500000

set match-hidden-files off
set page-completions off
set completion-query-items 350
set -o emacs

export LESS="-R"

# export DISPLAY if it's not set yet
[[ -z $DISPLAY ]] && export DISPLAY=":0.0"

# Customize to your needs...

# Autocomplete for 'g' as well
complete -o default -o nospace -F _git g
complete -o default -o nospace -F _git_branch gb
complete -o default -o nospace -F _git_checkout gco

source $HOME/.bash_aliases
source $HOME/.bash_functions
source $HOME/.bash_completion
source $HOME/.git_completion
source $HOME/.git_flow_completion
bind -f $HOME/.bash_bindings

# set fancy prompt
source $HOME/.bash_ps1

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
