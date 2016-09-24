#### Setting a variable

Let's assume that you need to set a variable to provide a value to your application. Just run:

```sh
cf set-env my-app MYVAR myvalue
```

The output should be:

```
$ cf set-env my-app MYVAR myvalue
Setting env variable 'MYVAR' to 'myvalue' for app my-app in org my-org / space my-first-space as my-user...
OK
TIP: Use 'cf restage' to ensure your env variable changes take effect
```

Although this variable will be immediately availabe to all your application instances, if you want your application to start reading the variable, you need to **restage** it. However, this is not a compusory step and you can skip it.

Running `cf env my-app` again will reveal that `MYVAR` and its value appear under the `User-Provided` section.
Now, define the second variable:

```sh
cf set-env my-app MY_OTHER_VAR myothervalue
```

Check the variables again. To unset (remove) a variable from the environment, do:

```sh
cf unset-env my-app MY_OTHER_VAR
```

The output should be:

```
$ cf unset-env my-app MY_OTHER_VAR
Removing env variable MY_OTHER_VAR from app my-app in org my-org / space my-first-space as my-user...
OK
TIP: Use 'cf restage' to ensure your env variable changes take effect
```

Easy as it seems, it is very powerful.
Also, you can set all of these variables in the application manifest, as we will see later on.
