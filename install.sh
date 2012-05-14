#!/bin/bash
dir=$HOME/.dotfiles

# old gitconfig backup
[[ -e $HOME/.gitconfig ]] && mv $HOME/.gitconfig $HOME/.gitconfig.old
ln -s "$dir/gitconfig" "$HOME/.gitconfig"

[[ -e $HOME/.gitignore ]] && mv $HOME/.gitignore $HOME/.gitignore.old
ln -s "$dir/gitignore" "$HOME/.gitignore"

if [[ `uname` == "Darwin"  ]]; then
    echo "source $dir/bash_profile" >> "$HOME/.bash_profile"
elif [[ `uname` == "Linux"  ]]; then
    echo "source $dir/bash_profile" >> "$HOME/.bashrc"
fi

#installing vim
[[ -e $HOME/.vim ]] && mv $HOME/.vim $HOME/.vim.old
ln -s "$dir/vim" "$HOME/.vim"

[[ -e $HOME/.vimrc ]] && mv $HOME/.vimrc $HOME/.vimrc.old
ln -s "$HOME/.vim/vimrc" "$HOME/.vimrc"
