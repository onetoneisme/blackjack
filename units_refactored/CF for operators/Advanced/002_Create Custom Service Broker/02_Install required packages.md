## Install required packages

1. Install **golang**
  ```
  sudo apt-get install golang-1.6
  sudo ln -sf /usr/lib/go-1.6/bin/go /usr/bin/go
  ```

1. Configure your `$GOPATH` and save it to your `.bashrc`
  ```
  export GOPATH=~/go
  mkdir $GOPATH
  echo "export GOPATH=$GOPATH" >> ~/.bashrc
  echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.bashrc
  source ~/.bashrc
  ```

1. Install [govendor](https://github.com/kardianos/govendor) tool
  ```
  go get -u github.com/kardianos/govendor
  ```
