### Getting help

Cloud Foundry's CLI has very good inline help.

Try executing the `cf` command without options. The help text is written to `stdout` and we recommend that you pipe the output through `less` or search by piping through `grep`. Notice the large number of available commands and their summaries.

This is fundamental to know as it will help you to navigate through the CLI's many commands.

As an example, let's say that you want to view all the commands related to `spaces`:

    cf | grep space

Now, suppose you want to get specific help on how to create a space with `create-space`.
Simply use the `help` command and specify the command you want help with:

    cf help create-space

This will show you something like:

    $ cf help create-space
    NAME:
       create-space - Create a space

    USAGE:
       cf create-space SPACE [-o ORG] [-q SPACE-QUOTA]

    OPTIONS:
       -o       Organization
       -q       Quota to assign to the newly created space (excluding this option results in assignment of default quota)

It's easy to get help with Cloud Foundry's CLI and perform operations on your Cloud Foundry deployment.
