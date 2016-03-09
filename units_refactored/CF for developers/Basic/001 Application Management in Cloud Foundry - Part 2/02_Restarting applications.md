### Restarting applications

There are several ways of restarting an application, each one with some differences that makes them very useful.

Try:

```sh
cf stop my-app
```

Output should be:

```
$ cf stop my-app
Stopping app my-app in org my-org / space my-first-space as my-user...
OK
```

Check that the application is halted successfully with `cf app my-app`. This will simply stop the application, leaving all the source code there, ready to be started again:

```sh
cf start my-app
```

Output will show that the application has been started again.

Those two steps can be summed combined:

```sh
cf restart my-app
```
