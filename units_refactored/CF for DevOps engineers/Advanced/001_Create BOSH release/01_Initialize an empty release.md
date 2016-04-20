### Initialize an empty release

```
$ bosh init release greeter-release
$ cd ~/greeter-release
```

After executing this command, the filesystem tree should look like the following:

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
