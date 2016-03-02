### Getting quota info

There is a way to get this information in a more wasy to read way:

```sh
cf quota default
```

Output should be:

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
