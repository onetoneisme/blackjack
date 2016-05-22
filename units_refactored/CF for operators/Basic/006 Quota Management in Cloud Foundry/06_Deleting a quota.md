#### Deleting a quota

Removing a quota definition from the system can be accomplished with:

```sh
cf delete-quota small-quota
```

The output should be:

```
$ cf delete-quota small-quota

Really delete the quota small-quota?> yes
Deleting quota small-quota as admin...
OK
```

> **Reminder:** You can always use the `-f` modifier to force a command without confirmation.
