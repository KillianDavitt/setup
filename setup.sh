#!/bin/bash

set -e
# Are we arch based or debian based?
release=$(ls /etc/ | grep -release)

if [[ $release == *"Arch"* ]]
then
  echo "I think this is arch"
  get="sudo pacman -Sy"
  $get git || true
elif [[ $release == *"debian"* ]]
then
  echo "I think this is debian"
  get="sudo apt-get install -y"
fi

echo "Creating git dir"
mkdir ~/git || true
cd ~/git
echo "Cloning dotfiles..."
git clone https://github.com/KillianDavitt/dotfiles.git

echo "Linking dotfiles..."
ln -S ~/git/dotfiles/.vimrc ~/.vimrc
ln -S ~/git/dotfiles/.bashrc ~/.bashrc
source ~/.bashrc

echo "Time to set up go!"
#Setup go first
ver=go1.5.1.linux-amd64.tar.gz
echo "Trying to get version: "$ver
wget https://storage.googleapis.com/golang/$ver
tar -C /usr/local -xzf $ver
go get -u github.com/odeke-em/drive/cmd/drive
drive init ~/drive
cd ~/drive

# Next priority is to setup the go drive cron scripts
cp ~/git/dotfiles/drivecron/drive_upload.sh /usr/local/bin/

get python3 zsh vim

