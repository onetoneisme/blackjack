### Update the app spec

Edit the following file `jobs/app/spec` and add the following content to it

```yaml
---
name: app
templates:
  ctl: bin/ctl

packages:
- greeter
- ruby

properties:
  port:
    description: "Port on which server is listening"
    default: 8080
```
