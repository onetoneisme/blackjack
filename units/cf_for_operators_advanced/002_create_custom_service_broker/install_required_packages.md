## Install required packages

1. Install **golang**
  ```exec
  wget https://storage.googleapis.com/golang/go1.7.linux-amd64.tar.gz
  sudo tar -xvf go1.7.linux-amd64.tar.gz
  sudo mv go /usr/local
  sudo ln -sf /usr/local/go/bin/go /usr/bin/go
  ```

1. Configure your `$GOPATH` and save it to your `.profile`
  ```exec
  export GOPATH=~/go
  mkdir $GOPATH
  echo "export GOPATH=$GOPATH" >> ~/.profile
  echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.profile
  source ~/.profile
  ```

1. Install govendor tool
  ```exec
  go get -u github.com/kardianos/govendor
  ```
