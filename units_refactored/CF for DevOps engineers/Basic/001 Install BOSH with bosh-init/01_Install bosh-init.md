### Install bosh-init

`bosh-init` is used to create and update a BOSH Director VM (and its persistent disk) in an environment.

1. Download the binary for your platform and place it on your $PATH. For example, on Linux machines:
    ```
    wget https://s3.amazonaws.com/bosh-init-artifacts/bosh-init-0.0.81-linux-amd64
    chmod +x bosh-init-*
    sudo mv bosh-init-* /usr/local/bin/bosh-init
    ```

2. Verify that `bosh-init` is properly installed:
    ```
    bosh-init -v
    ```

3. Install the prerequisite packages:
    ```
    sudo apt-get update
    sudo apt-get install -y build-essential zlibc zlib1g-dev ruby-dev openssl libxslt-dev libxslt1-dev libpq-dev libxml2-dev libssl-dev libreadline6 libreadline6-dev libyaml-dev libsqlite3-dev sqlite3 software-properties-common libmysqlclient-dev
    ```

4. Install Ruby:
    ```
    sudo apt-add-repository ppa:brightbox/ruby-ng -y
    sudo apt-get update
    sudo apt-get remove ruby* -y
    sudo apt-get install ruby2.1 -y
    ```

5. Verify Ruby 2+ is installed and added to your $PATH:
    ```
    ruby --version
    ```
