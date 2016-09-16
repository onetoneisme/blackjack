### Update the app spec

Open the file `jobs/app/spec` in a text editor and add the following lines:

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
