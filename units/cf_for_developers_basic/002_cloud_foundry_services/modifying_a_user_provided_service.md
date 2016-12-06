#### Modifying a user-provided service

Now, let's say you need to modify the user-provided service with a new key to specify the port:

```exec
cf uups my-fictional-service -p '{"host":"the-db-host","db_name":"the-db-name","username":"the-user-name","password":"the-super-secret-user-password","db_port":"3306"}'
```
>**Tip**: `uups` is an alias for `update-user-provided-service`. There is no interactive mode for this command.

Now, unbind the service from the `my-app` application and bind it again. Check the `cf env my-app` result, and you will see the changes there!

Do you want to see it in action?
Go to the `cf-example-sinatra` directory and do:

```exec
cd ~/cf-example-sinatra
git checkout with-ups
```

Now, do 
```exec
cf bs my-app my-fictional-service 
cf push my-app
```
>**Tip**: Instead of using `bind-service`, we are using its alias, `bs`.

Go to the URL that CF provides and you will see the credentials you have just entered with some service metadata.
