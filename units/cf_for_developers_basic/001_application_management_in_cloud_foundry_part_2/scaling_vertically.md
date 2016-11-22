### Scaling vertically

First, let's scale the memory limit of the `my-app` application:

```exec
cf scale my-app -m 512M -f
```

Since this is a *very* small application that barely consumes any memory, we can safely shrink memory usage down to 64M:

```exec
cf scale my-app -m 64M -f
```

After the application has been restarted, check the status with the `cp app my-app` command. You should see that both instances have been restarted successfully.
