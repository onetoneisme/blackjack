### Restarting applications

There are several ways to restart an application, each one with some differences that make them very useful.

Try:

```exec
cf stop my-app
```

Check that the application has been halted successfully with `cf app my-app`. This will simply stop the application, leaving all the source code there, ready to be started again:

```exec
cf start my-app
```

The output will show that the application has been restarted.

These two steps can also be combined, like so:

```sh
cf restart my-app
```
