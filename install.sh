#!/bin/bash
dir=$(pwd)
echo "source $dir/bash_profile" >> "$HOME/.profile"

# old gitconfig backup
[[ -e $HOME/.gitconfig ]] && mv $HOME/.gitconfig $HOME/.gitconfig.old
ln -sf $dir/gitconfig $HOME/.gitconfig

# To refresh bash
source $HOME/.profile
source $HOME/.profile
