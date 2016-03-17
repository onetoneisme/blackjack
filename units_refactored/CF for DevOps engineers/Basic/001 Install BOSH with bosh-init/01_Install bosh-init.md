## Install bosh-init

bosh-init is used to create and update a Director VM (and its persistent disk) in an environment.

1. Download the binary for your platform and place it on your $PATH. For example, on Linux machines:
```
wget https://s3.amazonaws.com/bosh-init-artifacts/bosh-init-0.0.81-linux-amd64
chmod +x bosh-init-*
sudo mv bosh-init-* /usr/local/bin/bosh-init
```

2. Verify bosh-init is properly installed
```
bosh-init -v
```

3. Install prerequisite packages
```
sudo apt-get update
sudo apt-get install -y build-essential zlibc zlib1g-dev ruby ruby-dev openssl libxslt-dev libxml2-dev libssl-dev libreadline6 libreadline6-dev libyaml-dev libsqlite3-dev sqlite3
```

4. Install RVM with ruby
```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s latest --ruby
source .profile
```

5. Verify Ruby 2+ is installed and in your $PATH
```
ruby --version
```
