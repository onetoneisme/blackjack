### ToC

1.	Introduction
2.	Restarting applications
3.	Restaging applications
4.	Scaling up and down
5.	Restarting an instance
6.	Environmental variables

### Introduction

Since we have deleted the application, lets deploy it again. But before, edit the `manifest.yml` file and change **only** the `name` attribute value to `my-app`. Save the file and push the application:

```
cf push
```

Now that we have an application running again! Yes, *that* easy.
