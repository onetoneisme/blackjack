#### Modifying and deleting spaces

Let's create a new space:

```
 $ cf create-space my-second-space
Creating space my-second-space in org my-org as admin...
OK
Assigning role SpaceManager to user admin in org my-org / space my-second-space as admin...
OK
Assigning role SpaceDeveloper to user admin in org my-org / space my-second-space as admin...
OK

TIP: Use 'cf target -o my-org -s my-second-space' to target new space
```

Now, in case we need to rename the space, its very easy to do that:

```sh
$ cf rename-space my-second-space my-trash-space
Renaming space my-second-space to my-trash-space in org my-org as admin...
OK
```

Again, you don't need to worry about changing the name, since the internal reference is maintained without alteration.

Deleting an space is really easy as well:

```sh
$ cf delete-space my-trash-space

Really delete the space my-trash-space?> yes
Deleting space my-trash-space in org my-org as admin...
OK
```

> **Tip:** you can use the `-f` modifier in some commands that ask for confirmation to force the "yes" without having to type it interactively. It is dangerous, but very useful when scripting commands. In this case, it should be `cf delete-space my-trash-space -f`
>