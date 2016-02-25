# Wget usually is not installed by default

# Are we arch based or debian based?
release=${ls /etc/ | grep -release}

if [[ $release == *"Arch"* ]]
then
  sudo pacman -Sy wget;
elif [[ $release == *"debian"* ]]
then
  sudo apt-get -y install wget
fi

#Setup go first
ver=go1.5.1.linux-amd64.tar.gz
wget https://storage.googleapis.com/golang/$ver
tar -C /usr/local -xzf $ver
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
go get -u github.com/odeke-em/drive/cmd/drive
drive init ~/drive
cd ~/drive
