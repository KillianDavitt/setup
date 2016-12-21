#!/bin/bash
echo "Please retrieve the general cmd password from lastpass now. Enter it here..."
read pass
echo "pass=".$pass >> ~/.bash_profile


set -e
get="sudo apt-get install -y "
$get git
echo "Installing git..."

echo "Creating git dir..."
mkdir ~/git || true
cd ~/git
echo "Cloning dotfiles..."
git clone https://github.com/KillianDavitt/dotfiles.git

echo "Linking dotfiles..."
exit()
cd ~
ln -S ~/git/dotfiles/.vimrc ~/.vimrc
ln -S ~/git/dotfiles/.bashrc ~/.bashrc
ln -S ~/git/dotfiles/.zshrc ~/.zshrc
mkdir -p ~/.ssh
cd ~/.ssh
ln -S ~/git/dotfiles/ssh-config ~/.ssh/config

source ~/.bashrc

$get python3 zsh vim rxvt-unicode

# vim plugins
mkdir ~/.vim
mkdir ~/.vim/bundle

cd ~/.vim/bundle
git clone https://github.com/bling/vim-airline
git clone https://github.com/altercation/vim-colors-solarized

# SSH keys

# Netsoc first
ssh-keygen -f ~/.ssh/id_netsoc -N '' -q
cat ~/.ssh/id_netsoc.pub | ssh netsoc "mkdir -p ~/.ssh && cat >>  ~/.ssh/authorized_keys"

docfile=$(ssh netsoc "ls -Art doc-backup | tail -n 1")
codefile=$(ssh netsoc "ls -Art code-backup | tail -n 1")


echo $docfile

sftp -b /dev/fd/0 netsoc <<EOF
cd doc-backup
get doc-backup/$docfile
get code-backup/$codefile
bye
EOF

mkdir ~/doc
mkdir ~/code

echo $pass | gpg --output ~/doc.tar.gz --decrypt $docfile

