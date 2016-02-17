#### Modifying a quota

It is very likely that at some point, you are going to realize that your quota has one or many parameters that have fallen short for the needed use, or that you need to limit a quota even more due to over usage.

Modifying - or *updating* - a quota is very simple in Cloud Foundry. The format is almost the same of the `create-quota` command, with minor differences.

As the first modification, lets disallow the use of paid plans in our `large-quota`:

```sh
cf update-quota large-quota --disallow-paid-service-plans
```

Output should be:

```
$ cf update-quota large-quota --disallow-paid-service-plans
Updating quota large-quota as admin...
OK
```

Now, users using this quota will not be able to provision any paid services.

Also, we can modify any other quota parameter as we see fit:

```sh
cf update-quota small-quota -i 256M -s 2
```

Output should be:

```
$ cf update-quota small-quota -i 256M -s 2
Updating quota small-quota as admin...
OK
```

As you can see, there is no need to re specify all the parameters of a quota, just the ones we need to modify.
