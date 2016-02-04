#### Deleting applications

Now, another command you will find useful is the `delete` command. This action will effectively delete an application from Cloud Foundry.

```
cf delete my-app
```

Output should be:

```
$ cf delete my-app

Really delete the app my-app?> yes
Deleting app my-app in org my-org / space my-first-space as my-user...
OK
```

> **Tip:** you can always skip confirmation by using the -f flag: `cf delete my-app -f`

Try now deleting the `my-sinatra-example` application, forcing the confirmation:

```
cf delete my-sinatra-example -f
```
