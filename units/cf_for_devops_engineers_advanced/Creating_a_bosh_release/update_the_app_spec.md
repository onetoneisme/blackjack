### Update the app spec

Open the file `jobs/app/spec` in a text editor and add the following lines:

```file=~/greeter-release/jobs/app/spec
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
