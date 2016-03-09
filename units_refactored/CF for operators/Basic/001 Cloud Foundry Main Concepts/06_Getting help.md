### Getting help

Cloud Foundry's CLI has a very good inline help.
Try executing the `cf` command without options. You will get a lot of commands and options with their descriptions.
This is fundamental to know, as it will help a lot to navigate through CF's CLI commands.
As an example, let's say that you want to view all the commands related to `spaces`. It is possible to tunnel the CLI help through Linux's `grep` command:

```
cf | grep space
```

Now, suppose you want to get specific help on how to create a space with `create-space`.
Simply use the `help` command and specify which action do you want help with:

```
cf help create-space
```

This will show you something like:

```
$ cf help create-space
NAME:
   create-space - Create a space

USAGE:
   cf create-space SPACE [-o ORG] [-q SPACE-QUOTA]

OPTIONS:
   -o       Organization
   -q       Quota to assign to the newly created space (excluding this option results in assignment of default quota)

```

It is very easy to get help with Cloud Foundry's CLI and perform operations on your Cloud Foundry foundation.
