#!/bin/bash
dir=$HOME/.dotfiles

# old gitconfig backup
[[ -e $HOME/.gitconfig ]] && mv $HOME/.gitconfig $HOME/.gitconfig.old
ln -sf $dir/gitconfig $HOME/.gitconfig

if [[ `uname` == "Darwin"  ]]; then
    echo "source $dir/bash_profile" >> "$HOME/.profile"
    # To refresh bash
    source $HOME/.profile
    source $HOME/.profile
elif [[ `uname` == "Linux"  ]]; then
    echo "source $dir/bash_profile" >> "$HOME/.bashrc"
    # To refresh bash
    source $HOME/.bashrc
    source $HOME/.bashrc
fi
