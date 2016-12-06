### Application files

Cloud Foundry's CLI provides a way to view the files in each instance of your deployed application and also see the contents of these files.

To view the files of an application, simply do:

```exec
cf files my-app
```

The output should be similar to:

```
$ cf files my-app
Getting files for app my-app in org my-org / space my-first-space as my-user...
OK

.bash_logout                              220B
.bashrc                                   3.6K
.profile                                  675B
app/                                         -
logs/                                        -
run.pid                                     3B
staging_info.yml                          334B
tmp/                                         -
```

As you can see, you are in the root of the application deployment directory structure. If you want to open one of the directories, specify it in the command line:

```exec
cf files my-app app/
```

Or run:

```exec
cf files my-app app/public
```

Viewing the content of a file is just as easy as listing files in a directory:

```exec
cf files my-app app/README.md
```

It is also possible to run the `cf files` command for a specific instance:

```exec
cf files my-app -i 1
```

This command will show the files for the second instance of `my-app`.
> **Tip**: Remember that instances start at index 0.
