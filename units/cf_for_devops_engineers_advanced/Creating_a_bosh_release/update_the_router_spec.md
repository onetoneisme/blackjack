### Update the router spec

Once you’ve created a router job, you can add the necessary configurations to it by opening the file `jobs/router/spec` in a text editor 
and adding the following content to it:

```file=~/greeter-release/jobs/router/spec
---
name: router
templates:
  ctl: bin/ctl
  config.yml.erb: config/config.yml

packages:
- greeter
- ruby

properties:
  port:
    description: "Port on which server is listening"
    default: 8080
  upstreams:
    description: "List of upstreams to proxy requests"
    default: []
```



