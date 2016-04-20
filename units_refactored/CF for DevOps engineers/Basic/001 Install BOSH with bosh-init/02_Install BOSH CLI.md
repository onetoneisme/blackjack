### Install BOSH CLI

The BOSH Command Line Interface (CLI) is used to interact with the Director. The CLI is written in Ruby and is distributed via the bosh_cli gem.

1. First, install some required packages
```
sudo apt-get install -y build-essential ruby ruby-dev libxml2-dev libsqlite3-dev libxslt1-dev libpq-dev libmysqlclient-dev zlib1g-dev
```

2. Then, install the bosh_cli gem.
```
 gem install bosh_cli --no-ri --no-rdoc
```
