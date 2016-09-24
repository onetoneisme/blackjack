#### Modifying and deleting organizations

At some point, you might need to rename one of the Orgs you have previously created. The good news is that Cloud Foundry maintains an internal reference for the Org, decoupling the name from the internal structure:

```sh
cf rename-org my-org my-renamed-org
```

The output should be:

```
$ cf rename-org my-org my-renamed-org
Renaming org my-org to my-renamed-org as admin...
OK
```

Also, at some point, is probable that we are going to need to delete an organization. You can do it with:

```sh
cf delete-org my-renamed-org
```

The CLI is going to ask for a confirmation and then effectively erase the org:

```
$ cf delete-org my-renamed-org

Really delete the org my-renamed-org and everything associated with it?> yes
Deleting org my-renamed-org as admin...
OK
```
>**Warning:** Deleting an Org means that Cloud Foundry will delete ALL objects and applications depending of that Org. It is a very destructive procedure, so be very carefull with it.
>
