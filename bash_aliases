#!/bin/bash

# handy aliases
alias top='top -o cpu'
alias ll='ls -lh'
alias ls='ls -l'
# Shows most used commands, cool script I got this from: http://lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
alias top_commands="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"
# rails alias
alias r="rails"


# vim alias
alias v="mvim"
alias mvimt="mvim --remote-tab"
alias mvt="mvim --remote-tab ."

# git alias
alias g='git'
alias gs='git status'
alias gc='git commit'
alias gca='git commit -a'
alias ga='git add'
alias gco='git checkout '
alias gb='git branch'
alias gm='git merge'
alias gd="git diff"
alias gg="git grep -n"
alias ggi="git grep -ni"

# fossil alias
alias f="fossil"
alias fs="fossil status"
alias fc="fossil commit"
alias fa="fossil add"
alias fe="fossil extra"
alias fn="fossil new"
alias fo="fossil open"
alias fu="fossil ui --port 8081"
alias fss="fossil sync"
alias fsas="fossil all sync"
alias fd="fossil diff"

# Directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
