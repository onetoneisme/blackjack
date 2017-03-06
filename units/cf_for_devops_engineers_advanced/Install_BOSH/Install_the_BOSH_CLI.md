### Install the BOSH CLI

The [BOSH Command Line Interface (CLI)](https://bosh.io/docs/cli-v2.html) is used to interact with the 
[BOSH Director](https://bosh.io/docs/bosh-components.html) as well as to create and update a BOSH Director VM 
(and its persistent disk) in an environment. 

##### 1. Install all prerequisite packages:

```exec
sudo apt-get update
  
sudo apt-get install -y build-essential zlibc zlib1g-dev ruby ruby-dev openssl libxslt-dev libxml2-dev libssl-dev libreadline6 libreadline6-dev libyaml-dev libsqlite3-dev sqlite3
```

###### 2. Download the binary for your platform and place it in your `/usr/local/bin/bosh` path. For example, on Linux machines:

```exec
curl https://s3.amazonaws.com/bosh-cli-artifacts/bosh-cli-2.0.1-linux-amd64 -o bosh
  
sudo install -m0755 bosh /usr/local/bin/bosh
  
rm bosh
```

##### 3. Verify that the `bosh` command  is properly installed:
```exec
bosh -v
```



