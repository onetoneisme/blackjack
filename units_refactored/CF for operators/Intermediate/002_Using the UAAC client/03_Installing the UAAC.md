### Installing the UAAC

The UAAC is developed in [Ruby](http://www.ruby-lang.org) and it is distributed as a [Ruby Gem](https://en.wikipedia.org/wiki/RubyGems). Ruby has been preinstalled in your training jumpbox, so you have to install it manually, but if you want to check out how, you can visit [RVM](https://www.rvm.io) (Ruby Version Manager) website.

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

It should show lots of output with the commands and options it provides.
