#!/bin/bash
echo "source ~/.dot/profile" >> ~/.profile

files=( bash_ps1 bash_profile bash_bindings bashrc bash_aliases bash_completion bash_functions git_completion git_flow_completion gitconfig bin )

for file in ${files[@]}; do
  file="$HOME/.$file"
  [ -e "$file" ] && ln -sf "$HOME/.dotfiles/$file" "$HOME/.$file"
done
