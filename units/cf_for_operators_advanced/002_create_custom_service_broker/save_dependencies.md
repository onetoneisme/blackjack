## Save dependencies

The `govendor` tool saves all your application dependencies into the `vendor` directory in order to implement the native vendoring

```exec
cd ~/go/src/github.com/vcap/cf-postgresql-broker
govendor init
govendor add +external
```
