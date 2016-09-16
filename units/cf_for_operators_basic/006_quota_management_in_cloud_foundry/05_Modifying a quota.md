#### Modifying a quota

It is very likely that, at some point, you are going to realize that one or many of the limits set by your quota are too strict and users are running low on resources, or that you need to limit a quota even more due to overusage.

Modifying - or *updating* - a quota is very simple in Cloud Foundry. The format is almost the same as in the `create-quota` command.

As the first modification, let's disallow the use of paid plans in our `large-quota`:

```sh
cf update-quota large-quota --disallow-paid-service-plans
```

The output should be:

```
$ cf update-quota large-quota --disallow-paid-service-plans
Updating quota large-quota as admin...
OK
```

Now, users of this quota will not be able to provision any paid services.

Also, we can modify any other quota parameter as we see fit:

```sh
cf update-quota small-quota -i 256M -s 2
```

The output should be:

```
$ cf update-quota small-quota -i 256M -s 2
Updating quota small-quota as admin...
OK
```

As you can see, there is no need to re-specify all the parameters of a quota, except for the ones we need to modify.
