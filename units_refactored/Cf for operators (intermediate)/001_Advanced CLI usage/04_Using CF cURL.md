### Using `cf curl`

At some time, you will probably want to script some actions in base at some Cloud Foundry's responses.
In that case, the `cf curl` command is very useful. You can get responses from Cloud Foundry and parse them to get data from them.
`cf curl` uses the good old `curl` command, setting the authorization data and the requests headers required by Cloud Foundry.

Try it by executing `cf curl /v2/apps`.

You will get a JSON object that contains all the information for all the deployed applications.

So, how to use this data?
You can install the `jq` JSON parser, by doing `sudo apt-get install jq`.
Now, you can parse the response with `jq`:

```sh
cf curl /v2/apps | jq .resources[].entity.name
```

The following script will get the application name indirectly:

```sh
#!/bin/bash
set -e

APP_URL=$(cf curl /v2/apps | jq -r ".resources[].metadata.url")
APP_NAME=$(cf curl $APP_URL | jq -r ".entity.name")

echo My App name is: $APP_NAME
```
