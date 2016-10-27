### Initialize an empty release

Run the following commands to intialize a new release:
```
bosh init release greeter-release
cd ~/greeter-release
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
