## Create the router config template

Edit the following file `jobs/router/templates/config.yml.erb` and add the following content to it

```
---
servers: <%= p('servers') %>
```
