#### Setting a variable

Suposse that you need to set a variable to provide a value to your application. Just do:

```
cf set-env my-app MYVAR myvalue
```

Output should be:

```
$ cf set-env my-app MYVAR myvalue
Setting env variable 'MYVAR' to 'myvalue' for app my-app in org my-org / space my-first-space as my-user...
OK
TIP: Use 'cf restage' to ensure your env variable changes take effect
```

Although this variable will be imeediately availabe to all you application instances, if you want your application to start reading the variable you should **restage** it. However, since it is not necessary, you can skip that step.

If you run again `cf env my-app`, you will see that `MYVAR` and it's value appears under the `User-Provided` section.
Now, define a second variable:

```
cf set-env my-app MY_OTHER_VAR myothervalue
```

Check again the variables. To unset (remove) a variable from the environment, you simply do:

```
cf unset-env my-app MY_OTHER_VAR
```

Output should be:

```
$ cf unset-env my-app MY_OTHER_VAR
Removing env variable MY_OTHER_VAR from app my-app in org my-org / space my-first-space as my-user...
OK
TIP: Use 'cf restage' to ensure your env variable changes take effect
```

Easy as it seems, it is very powerful.
Also, you can set all of this variables in the application manifest, as we will see later on.