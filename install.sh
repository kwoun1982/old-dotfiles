#!/bin/bash
dir=$HOME/.dotfiles

# old gitconfig backup
[[ -e $HOME/.gitconfig ]] && mv $HOME/.gitconfig $HOME/.gitconfig.old

if [[ `uname` == "Darwin"  ]]; then
    echo "source $dir/bash_profile" >> "$HOME/.bash_profile"
elif [[ `uname` == "Linux"  ]]; then
    echo "source $dir/bash_profile" >> "$HOME/.bashrc"
fi
