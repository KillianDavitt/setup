#Setup go first
#ver=go1.5.1.linux-amd64.tar.gz
#wget https://storage.googleapis.com/golang/$ver
#tar -C /usr/local -xzf $ver
#export PATH=$PATH:/usr/local/go/bin
#export GOPATH=$HOME/go
go get -u github.com/odeke-em/drive/cmd/drive
drive init ~/drive
cd ~/drive
