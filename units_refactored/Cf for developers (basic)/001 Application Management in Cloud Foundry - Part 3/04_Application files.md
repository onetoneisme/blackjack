### Application files

Cloud Foundry's CLI also provides a way to view the files in each instance of your deployed applications, as well as the content of a file.

To view the files of an application, simply do:

```sh
cf files my-app
```

Output should be similar to:

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

As you can see, you are in the root of the application deployment directory structure. If you want to go inside of one of the directories, specify it in the command line:

```sh
cf files my-app app/
```

Or

```sh
cf files my-app app/public
```

Viewing the content of a file is as easy as getting the files in a directory:

```sh
cf files my-app app/README.md
```

Also, it is possible to run the `cf files` command for an specific instance:

```sh
cf files my-app -i 1
```

That command will show the files for the 2nd instance of `my-app`.
> **Tip**: Remember that instances start at index 0.
