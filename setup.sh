#!/bin/bash

set -e
# Are we arch based or debian based?
if [ ! -f /etc/lsb-release ]; then
    echo "This is not debian, probably arch!"
    get="sudo pacman -Sy "
else
    echo "This is debian based"
    get="sudo apt-get install -y "
fi

get git
echo "Installing git..."

echo "Creating git dir..."
mkdir ~/git || true
cd ~/git
echo "Cloning dotfiles..."
git clone https://github.com/KillianDavitt/dotfiles.git

echo "Linking dotfiles..."
ln -S ~/git/dotfiles/.vimrc ~/.vimrc
ln -S ~/git/dotfiles/.bashrc ~/.bashrc
ln -S ~/git/dotfiles/.zshrc ~/.zshrc
ln -S ~/git/dotfiles/ssh-config ~/.ssh/config

source ~/.bashrc

get python3 zsh vim

