### Getting a CLI authorization token

If you want to use a tool other than `cf curl` to access the Cloud Foundry API, you are going to need an authorization token.
Cloud Foundry issues one authorization token per every application that gets authenticated.
To demostrate how you can use this token, we will make a regular `curl` request.

Let us try the `curl` command without a token:

```sh
curl http://api.{{echo $CF_DOMAIN}}
```

It will return something like:

```
$ curl http://api.{{echo $CF_DOMAIN}}
{
  "code": 10002,
  "description": "Authentication error",
  "error_code": "CF-NotAuthenticated"
}
```

To authorize the request, you need to get a token:

```sh
cf oauth-token
```

This will return a token for the CLI's session:

```
$ cf oauth-token
Getting OAuth token...
OK

bearer eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIwOWQwNzhiYS1lZmU5LTQ3YzgtYjJiNC0zNDE1NzljZGRlYmIiLCJzdWIiOiJkMWViNzg1OS1iZWFjLTQyMTctYWQzMy1lMzc3MzBiM2ZmYTYiLCJzY29wZSI6WyJjbG91ZF9jb250cm9sbGVyLnJlYWQiLCJwYXNzd29yZC53cml0ZSIsImNsb3VkX2NvbnRyb2xsZXIud3JpdGUiLCJvcGVuaWQiXSwiY2xpZW50X2lkIjoiY2YiLCJjaWQiOiJjZiIsImF6cCI6ImNmIiwiZ3JhbnRfdHlwZSI6InBhc3N3b3JkIiwidXNlcl9pZCI6ImQxZWI3ODU5LWJlYWMtNDIxNy1hZDMzLWUzNzczMGIzZmZhNiIsIm9yaWdpbiI6InVhYSIsInVzZXJfbmFtZSI6Imp1YW4ucGFibG8uZ2Vub3Zlc2VAYWx0b3Jvcy5jb20iLCJlbWFpbCI6Imp1YW4ucGFibG8uZ2Vub3Zlc2VAYWx0b3Jvcy5jb20iLCJyZXZfc2lnIjoiNTBiZDBmMCIsImlhdCI6MTQ1NjI2MjkxMCwiZXhwIjoxNDU2MzA2MTEwLCJpc3MiOiJodHRwczovL3VhYS5uZy5ibHVlbWl4Lm5ldC9vYXV0aC90b2tlbiIsInppZCI6InVhYSIsImF1ZCI6WyJjbG91ZF9jb250cm9sbGVyIiwicGFzc3dvcmQiLCJjZiIsIm9wZW5pZCJdfQ.KL6lQ2LPFhzyT8kymxuLa9qJ_XG1IDkg_-Dex9L3ce4
```

This authentication token is what we need to do our regular `curl` command:

```sh
curl -H 'Authorization: {{cf oauth-token}}' http://api.{{echo $CF_DOMAIN}}
```

Ok, yes, it is a bulky request, but it works!
