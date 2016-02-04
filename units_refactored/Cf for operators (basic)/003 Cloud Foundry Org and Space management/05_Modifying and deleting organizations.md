#### Modifying and deleting organizations

One situation that might happen, is that you need to rename one of the Orgs you created. Do not worry about this situation, since Cloud Foundry maintains an internal reference for the Org, decoupling the name from the internal structure:

```
cf rename-org my-org my-renamed-org
```

Output should be:

```
$ cf rename-org my-org my-renamed-org
Renaming org my-org to my-renamed-org as admin...
OK
```

Also, at some point is probable that we are going to need to delete an organization.

```
cf delete-org my-renamed-org
```

The CLI is going to ask for confirmation and then effectively erase the org:

```sh
$ cf delete-org my-renamed-org

Really delete the org my-renamed-org and everything associated with it?> yes
Deleting org my-renamed-org as admin...
OK
```
>**Warning:** Deleting an Org means that Cloud Foundry will delete ALL objects and applications depending of that Org. It is a very destructive procedure, so be very carefull with it.
>
