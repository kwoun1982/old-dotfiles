#!/bin/bash
dir=$HOME/.dotfiles

# old gitconfig backup
[[ -e $HOME/.gitconfig ]] && mv $HOME/.gitconfig $HOME/.gitconfig.old
ln -sf $dir/gitconfig $HOME/.gitconfig

if [[ `uname` == "Darwin"  ]]; then
    echo "source $dir/bash_profile" >> "$HOME/.profile"
elif [[ `uname` == "Linux"  ]]; then
    echo "source $dir/bash_profile" >> "$HOME/.bash_profile"
fi
