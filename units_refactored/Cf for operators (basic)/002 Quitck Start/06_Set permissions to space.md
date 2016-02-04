Set permissions to space
------------------------

Now you need to add the necessary permissions for your user to use the Org and Space you have created:

```
cf set-space-role test-user training test-space SpaceDeveloper
```

Now your user has permissions to deploy an application. But first and foremost, autenticate with your credentials, you can be with `cf auth` or `cf login`.

If you want to know more about Cloud Foundry's permissions and roles, go to the [Cloud Foundry's official documentation](https://docs.cloudfoundry.org/concepts/roles.html#roles).
