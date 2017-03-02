### Initialize an empty release

To initialize a new release, run the following commands:
```exec
mkdir   ~/greeter-release
cd ~/greeter-release
bosh init-release
```

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



