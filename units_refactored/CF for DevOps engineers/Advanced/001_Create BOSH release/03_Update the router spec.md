## Update the router spec

Edit the following file `jobs/router/spec` and add the following content to it

```
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
  servers:
    description: "List of servers to redirect requests"
    default: []
```
