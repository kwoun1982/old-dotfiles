#!/bin/bash

DOTFILES=$HOME/.dotfiles

# Bash completion (installed via Homebrew; source after `brew` is added to PATH)
[ -r "$(brew --prefix)/etc/bash_completion" ] && source "$(brew --prefix)/etc/bash_completion"

if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
    . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
    . `brew --prefix`/etc/bash_completion.d/git-prompt.sh
fi

export PATH="\
$DOTFILES/bin:\
/usr/local/bin:\
$HOME/.rvm/bin:\
$(brew --prefix coreutils)/libexec/gnubin:\
$PATH:\
"&>/dev/null

# Load files
files=(bash_prompt bash_functions bash_aliases bash_exports)
for file in ${files[@]}; do
  file="$DOTFILES/$file"
  [ -e "$file" ] && source "$file"
done

bind -f $DOTFILES/bash_bindings

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# append to the history file, don't overwrite it
shopt -s histappend >/dev/null 2>&1

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# no duplicates in bash history and ignore same sucessive entries. 
set match-hidden-files off
set page-completions off
set completion-query-items 350

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null
done

# Autocomplete for 'g' as well
complete -o default -o nospace -F _git g

# Customize to your needs...
