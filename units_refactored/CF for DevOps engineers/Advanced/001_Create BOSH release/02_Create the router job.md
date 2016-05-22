### Create a router job

Create a router job with:
```
bosh generate job router
```

After executing this command, the filesystem tree should look like this:

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
