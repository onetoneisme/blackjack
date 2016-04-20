### ToC

1.	Introduction
2.	Restarting applications
3.	Restaging applications
4.	Scaling up and down
5.	Restarting an instance
6.	Environmental variables

### Introduction

Since we deleted the application, let's deploy it again. But first, edit the `manifest.yml` file and change **only** the `name` attribute value to `my-app`. Save the file and push the application:

```sh
cf push
```

Now that we have an application running again! Yes, *that* easy.
