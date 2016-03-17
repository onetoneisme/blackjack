Viewing logs
------------

To view logs for a given application, run the `cf logs` command. You must specify the application name as a parameter.

Do a `cf apps` to view and copy the URL for the app.
```
cf apps
```

Use `cf logs` to view the realtime logs:
```
cf logs Sinatra-Example-app
```

Open another browser window or tab and navigate to the app URL you copied above.  After a brief moment, the application logs will stream into your console.  Stop viewing the logs with Ctrl-C.
