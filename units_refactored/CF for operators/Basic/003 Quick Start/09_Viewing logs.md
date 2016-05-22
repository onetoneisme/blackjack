Viewing logs
------------

To view logs for a given application, run the `cf logs` command. You must specify the application name as a parameter.

Use `cf apps` to view the URL for the app.
```
cf apps
```

Use `cf logs` to view the real-time logs:
```
cf logs Sinatra-Example-app
```

Generate traffic by browsing to the app URL (`http://sinatra-example-app.{{echo $CF_DOMAIN}}`).  After a brief moment, the application logs will stream into your console. Use `Ctrl-C` to stop `cf logs`.
