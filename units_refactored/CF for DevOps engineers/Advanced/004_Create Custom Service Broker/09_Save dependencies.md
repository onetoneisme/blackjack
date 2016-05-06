## Save dependencies

[Go buildpack](https://github.com/cloudfoundry/go-buildpack) requires `Godeps` in order to install vendor dependencies. So let's just save them.

```
$ godep save
```

It should create the `Godeps/Gogeps.json` manifest file and copy packages that our application uses into the `vendor` directory.
