### Restarting an instance

Sometimes it happens and an instance gets interrupted in it's normal behaviour by some reason.
To restart it and have it working again, you can use the `cf restart-app-instance` command.

Let's say that the instance number **2** of your application stopped somehow. Restart it by doing:

```sh
cf restart-app-instance my-app 2
```

Output should be:

```
$ cf restart-app-instance my-app 2
Restarting instance 2 of application my-app as my-user
OK
```
