#### Creating spaces

Spaces are a very convenient way of separating concerns and environments inside an Org. Managing Spaces is no different from managing Orgs.

To create an space, it is as simple as:

```sh
cf create-space my-first-space
```

The CLI will offer detailed information about the space created:

```sh
$ cf create-space my-first-space
Creating space my-first-space in org my-org as admin...
OK
Assigning role SpaceManager to user admin in org my-org / space my-first-space as admin...
OK
Assigning role SpaceDeveloper to user admin in org my-org / space my-first-space as admin...
OK

TIP: Use 'cf target -o my-org -s my-first-space' to target new space
```

> **Tip:** Notice that the CLI offers you help in many commands on what to do next, such as how to target the space you just created.
>

Now, try listing all the spaces again with the `cf spaces` command.
