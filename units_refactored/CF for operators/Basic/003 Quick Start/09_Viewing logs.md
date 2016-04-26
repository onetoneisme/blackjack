Viewing logs
------------

To view logs for a given application, run the `cf logs` command. You must specify the application name as a parameter.

Use `cf apps` to view the URL for the app.
```
cf apps
```

Use `cf logs` to view the realtime logs:
```
cf logs Sinatra-Example-app
```

Generate traffic by browsing to the app URL <a href="http://sinatra-example-app.{{echo $CF_DOMAIN}}" target="_blank">(http://sinatra-example-app.{{echo $CF_DOMAIN}})</a>.  After a brief moment, the application logs will stream into your console.  Use Ctrl-C to stop `cf logs`.
