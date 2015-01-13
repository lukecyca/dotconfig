export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=~/Code/gocode

function cdgo {
    cd ~/Code/gocode/src/$1
}
