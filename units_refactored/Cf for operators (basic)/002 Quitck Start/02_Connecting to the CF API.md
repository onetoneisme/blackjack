Connecting to the CF API
------------------------

Cloud Foundry provides an API endpoint to perform different operations and interact seamlessly with the whole foundation.

Using the CLI requires to connect to the API CF, for the CLI to know where to send the commands.

To connect to Cloud Foundry's API, you need to use the `cf api` command.

```
cf api --skip-ssl-validation https://api.{{cf-get-instance-ip}}.xip.io
```

In the case of a successful connection, the following information will be displayed:

```
Setting api endpoint to https://api.{{cf-get-instance-ip}}.xip.io ...
OK
```

> **Important**: we are using `--skip-ssl-validation` since the Cloud Foundry deployment we are using for this course doesn't have a SSL certificate installed, but as a good practice for development and testing, and mandatory for production, a SSL cert should always be present.

Now, you need to provide credentials. This is accomplished through interactive command `cf login`. For this part of the training course, use the `admin` / `admin` credentials.