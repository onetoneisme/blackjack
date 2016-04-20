#### Deleting a quota

Removing a quota definition from the system is very easy:

```sh
cf delete-quota small-quota
```

Output should be:

```
$ cf delete-quota small-quota

Really delete the quota small-quota?> yes
Deleting quota small-quota as admin...
OK
```

> **Reminder:** you can always use the `-f` modifier to force the command without confirmation
