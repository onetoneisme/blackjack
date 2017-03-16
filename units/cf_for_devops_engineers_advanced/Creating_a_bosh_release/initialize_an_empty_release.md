### Initialize an empty release

First of all, we need to create the release directory, navigate into the workspace where you want the release to be, and run `bosh init release <release_name>`


In our case the command will be the following:

```exec
mkdir   ~/greeter-release
cd ~/greeter-release
bosh init release
```
You can also add the `--git` option to initialize a git repository.

After executing this command, the filesystem tree should look like this:

```
$ tree
.
├── blobs
├── config
│   └── blobs.yml
├── jobs
├── packages
└── src
```

