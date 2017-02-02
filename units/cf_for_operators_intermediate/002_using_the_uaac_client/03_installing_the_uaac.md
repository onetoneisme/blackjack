### Installing the UAAC

In order to install UAAC, you need to install Ruby. 

To install Ruby follow th instructions below: 
1)Before any other step install mpapis public key:
```sh 
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
```
2) Install RVM stable with Ruby:
```sh
\curl -sSL https://get.rvm.io | bash -s stable --ruby
```
3) To start using rvm run `source /home/vcap/.rvm/scripts/rvm`

The UAAC is written in [Ruby](http://www.ruby-lang.org) and distributed as a [Ruby gem](https://en.wikipedia.org/wiki/RubyGems). Ruby has been pre-installed on your training jumpbox, so you don't have to install it manually.

To install the UAAC, you can do:

```sh
gem install cf-uaac
```

This will output something like:

```
$ gem install cf-uaac
Fetching: cf-uaac-3.1.7.gem (100%)
Successfully installed cf-uaac-3.1.7
Parsing documentation for cf-uaac-3.1.7
Installing ri documentation for cf-uaac-3.1.7
Done installing documentation for cf-uaac after 0 seconds
1 gem installed
```

Just to try it, type:

```sh
uaac help
```

It should show a lot of output with the commands and options the UAAC provides.
