### Restarting an instance

Sometimes an instance may get interrupted, which may actually be normal behaviour justified by a number of reasons.
To restart it and have it working again, you can use the `cf restart-app-instance` command.

Let's say instance **#2** of your application has stopped for some reason. Restart it with:

```sh
cf restart-app-instance my-app 2
```

The output should be:

```
$ cf restart-app-instance my-app 2
Restarting instance 2 of application my-app as my-user
OK
```
