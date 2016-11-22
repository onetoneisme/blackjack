### Scaling horizontally

Try scaling your application up to two instances:

```exec
cf scale my-app -i 2
```

Now, check the status of the application:

```sh
cf app my-app
```

You can see that there are now two instances of `my-app` running!
