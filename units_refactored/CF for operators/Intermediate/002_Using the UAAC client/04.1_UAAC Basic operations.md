### Basic UAAC operations

#### Connecting to Cloud Foundry's UAA server

First, target your deployment:

```sh
uaac target uaa.{{echo $CF_DOMAIN}} --skip-ssl-validation
```
> **Tip**: We are targeting the `UAA` endpoint instead of the `API`. This is because the UAAC connects to and operates directly through the UAA component.
> **Warning**: Notice that, again, we are skipping SSL validation when connecting to the UAA. This is NOT recommended for real-life deployments.

For the next step, you will need to know the `uaa:admin:client:secret` property from Cloud Foundry's deployment manifest.
In this case, and for the sake of simplicity, we will simply provide it to you: `admin-secret`

Well, that "secret" is not much of a secret really, but we will learn how to change it in a different section.

The second step is to get authorized to use the UAAC:

```sh
uaac token client get admin -s admin-secret
```

This should output something like:

```sh
$ uaac token client get admin -s admin-secret

Successfully fetched token via client credentials grant.
Target: https://uaa.{{ echo $CF_DOMAIN }}
Context: admin, from client admin
```
