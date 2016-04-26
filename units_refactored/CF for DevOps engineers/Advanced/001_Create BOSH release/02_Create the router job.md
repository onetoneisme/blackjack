### Create the router job

```
bosh generate job router
```

After executing this command, the filesystem tree should look like the following:

```
$ tree
.
├── blobs
├── config
│   └── blobs.yml
├── jobs
│   └── router
│       ├── monit
│       ├── spec
│       └── templates
├── packages
└── src
```
