### Create a router config template

Create a config template for the router by opening the file `jobs/router/templates/config.yml.erb` and adding the following lines to it:

```file=~/greeter-release/jobs/router/templates/config.yml.erb
---
upstreams: <%= p('upstreams') %>
```
