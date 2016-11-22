#### Setting a variable

Let's assume that you need to set a variable to provide a value to your application. Just run:

```exec
cf set-env my-app MYVAR myvalue
```

Although this variable will be immediately availabe to all your application instances, if you want your application to start reading the variable, you need to **restage** it. However, this is not a compusory step and you can skip it.

Running `cf env my-app` again will reveal that `MYVAR` and its value appear under the `User-Provided` section.
Now, define the second variable:

```exec
cf set-env my-app MY_OTHER_VAR myothervalue
```

Check the variables again. To unset (remove) a variable from the environment, do:

```exec
cf unset-env my-app MY_OTHER_VAR
```

Easy as it seems, it is very powerful.
Also, you can set all of these variables in the application manifest, as we will see later on.
