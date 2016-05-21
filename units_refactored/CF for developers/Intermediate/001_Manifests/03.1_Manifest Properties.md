#### More properties

Immediately below the memory, we will specify a disk quota:

```yaml
---
applications:
- name: "my-app"
  memory: 128M
  disk_quota: 256M
```

Now our application has some limits!

Let's add another attribute. This time, it will be an application startup timetout specified in seconds:

```yaml
---
applications:
- name: "my-app"
  memory: 128M
  disk_quota: 256M
  timeout: 120
```

Also, let's add the `host` attribute to specify that we want our app to be reached as `my-precious-app.{{ echo $CF_DOMAIN }}`.

The `host` property will generate a route (more on routes later), but for all the CLI operations the app will still be called `my-app`.

```yaml
---
applications:
- name: "my-app"
  memory: 128M
  disk_quota: 256M
  timeout: 120
  host: "my-precious-app"
```

Now, do `cf push` without specifying any command line options.

You should have your `my-app` running with a 128M memory limit and 256M disk quota, and it will be accesible [here](http://my-precious-app.{{ echo $CF_DOMAIN }}).
