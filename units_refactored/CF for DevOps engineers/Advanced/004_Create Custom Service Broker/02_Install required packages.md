## Install required packages

1. Install **golang**

```
$ sudo apt-get install golang
```

2. Configure your `$GOPATH` and save it to your `.bashrc`

```
$ export GOPATH=~/go
$ mkdir $GOPATH
$ echo "export GOPATH=$GOPATH" >> ~/.bashrc
$ echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.bashrc
$ source ~/.bashrc
```

3. Install [godep](go get github.com/tools/godep) tool

```
$ go get github.com/tools/godep
```
