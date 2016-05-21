### Getting quota info

It is also possible to get the same information in a more easy-to-read way:

```sh
cf quota default
```

The output should be:

```
$ cf quota default
Getting quota default info as admin...
OK

Total Memory         10G
Instance Memory      unlimited
Routes               1000
Services             100
Paid service plans   allowed
```
