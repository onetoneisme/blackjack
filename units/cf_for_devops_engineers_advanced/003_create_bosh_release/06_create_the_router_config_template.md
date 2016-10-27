### Create the router config template

Create a config template for the router by opening the file `jobs/router/templates/config.yml.erb` and adding the following lines to it:

```yaml
---
upstreams: <%= p('upstreams') %>
```
