### Table of contents

1.	Introduction
2.	Restarting applications
3.	Restaging applications
4.	Scaling up and down
5.	Restarting an instance
6.	Environment variables

### Introduction

Since we have deleted the application, let's deploy it again. But first, edit the `manifest.yml` file and change **only** the `name` attribute value to `my-app`. Then save the file and push the application:

```exec
cd ~/cf-example-sinatra
cf push
```

Our application is running again! Yes, it's *that* easy.
