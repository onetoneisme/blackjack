Set permissions to space
------------------------

Now you need to add the necessary permissions for your user to use the Org and Space you have created:

```sh
cf set-space-role test-user training test-space SpaceDeveloper
```

Now your user has permissions to deploy an application. But first and foremost, autenticate with your credentials, you can be with `cf auth` (such as shown in the example) or `cf login`.

```sh
cf auth test-user "test-password"
```
