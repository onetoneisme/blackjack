Connecting to the CF API
------------------------

Cloud Foundry provides an API endpoint to perform different operations and interact seamlessly with the whole foundation.

Using the CLI requires to connect to the API CF, for the CLI to know where to send the commands.

To connect to Cloud Foundry's API, you need to use the `cf api` command.

```sh
cf api --skip-ssl-validation https://api.{{echo $CF_DOMAIN}}
```

In the case of a successful connection, the following information will be displayed:

```
Setting api endpoint to https://api.{{echo $CF_DOMAIN}}...
OK
```

> **Important**: we are using `--skip-ssl-validation` since the Cloud Foundry deployment we are using for this course doesn't have a trusted SSL certificate installed, but as a good practice for development and testing, and mandatory for production, a trusted SSL cert should always be present.

Now, you need to provide credentials. This is accomplished through interactive command `cf login`. For this part of the training course, use the `admin` / `PASSWORD` credentials.

> **Tip**: you can also use the `cf login` command setting the API: `cf login --skip-ssl-validation -a https://api.{{echo $CF_DOMAIN}}`
