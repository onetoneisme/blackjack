#### Custom startup commands

Some buildpacks will ask you to issue a custom startup command for your application and you might want to change the default Web server.

In this case, we will issue a very simple command to start our application with a the [Thin](http://code.macournoyer.com/thin/) Web server in the context of the installed gems (libraries).

First, open the `Gemfile` file and add `gem "thin"` at the end. Save it.

Then, open the `manifest.yml` file again and add the `command` key as follows:

```yaml
---
applications:
- name: "my-app"
  memory: 128M
  disk_quota: 256M
  timeout: 120
  host: "my-precious-app"
  command: "bundle exec thin start -p $PORT -R config.ru"
```

The `$PORT` variable in the `command` value is injected by Cloud Foundry automatically. We'll get to it later.

Now, `push` the application again and you will see that, at some point of the log output, it says:

	`App my-app was started using this command 'bundle exec thin start -p $PORT -R config.ru'`

Cool! Now, we know how to issue custom startup commands.

> **Tip**: It is a good practice to keep these startup commands in a `Procfile`. In our case, the `Procfile` will contain only one line: `web: bundle exec thin start -p $PORT -R config.ru`. Once you have the `Procfile` set up, you can remove the `command` key from the `manifest.yml`.
