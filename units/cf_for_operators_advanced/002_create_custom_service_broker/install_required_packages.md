## Install required packages

1. Install **golang**
  ```
  wget https://storage.googleapis.com/golang/go1.7.linux-amd64.tar.gz
  sudo tar -xvf go1.7.linux-amd64.tar.gz
  sudo mv go /usr/local
  sudo ln -sf /usr/local/go/bin/go /usr/bin/go
  ```

1. Configure your `$GOPATH` and save it to your `.bashrc`
  ```
  export GOPATH=~/go
  mkdir $GOPATH
  echo "export GOPATH=$GOPATH" >> ~/.bashrc
  echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.bashrc
  source ~/.bashrc
  ```

1. Install govendor tool
  ```
  go get -u github.com/kardianos/govendor
  ```
