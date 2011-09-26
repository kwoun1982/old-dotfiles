#!/bin/bash
# Load ~/.bash_ps1, ~/.bash_aliases, ~/.bash_completion, ~/.bash_functions, ~/.git_completion and ~/.git_flow_completion
# ~/.extra can be used for settings you don’t want to commit

uptime

files=( bash_ps1 bash_profile bash_bindings bashrc bash_aliases bash_completion bash_functions git_completion git_flow_completion )
for file in ${files[@]}; do 
  file="$HOME/.$file"
  [ -e "$file" ] && source "$file"
done

bind -f $HOME/.bash_bindings

export PATH="\
$PATH:\
/usr/local/bin:\
/opt/local/bin:\
/usr/local/pgsql/bin:\
/usr/local/mysql/bin:\
/usr/local/Cellar/postgresql/9.0.4/bin/"\
&>/dev/null

# put ~/bin on PATH if you have it
test -d "$HOME/.bin" &&
  PATH="$HOME/.bin:$PATH"

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

export HISTSIZE=100000
export HISTFILESIZE=500000
export LESS="-R"
[[ -z $DISPLAY ]] && export DISPLAY=":0.0"

# no duplicates in bash history and ignore same sucessive entries. 
HISTCONTROL=ignoredups:erasedups
shopt -s histappend >/dev/null 2>&1
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"
export HISTIGNORE="l[sla]:rm:mv:mkdir:cd:[bf]g:exit:logout"

set match-hidden-files off
set page-completions off
set completion-query-items 350
set -o emacs
# notify of bg job completion immediately
set -o notify

# Autocomplete for 'g' as well
complete -o default -o nospace -F _git g
complete -o default -o nospace -F _git_branch gb
complete -o default -o nospace -F _git_checkout gco

# Customize to your needs...

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
