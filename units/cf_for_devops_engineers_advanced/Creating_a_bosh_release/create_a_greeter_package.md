### Create a greeter package

Generate a greeter package with:
```exec
cd ~/greeter-release
bosh generate package greeter
```

After executing this command, the filesystem tree should look similar to this:

```
$ tree
.
├── blobs
├── config
│   └── blobs.yml
├── creating_this_bosh_release.md
├── jobs
│   ├── app
│   │   ├── monit
│   │   ├── spec
│   │   └── templates
│   │       └── ctl
│   └── router
│       ├── monit
│       ├── spec
│       └── templates
│           ├── config.json.erb
│           └── ctl
├── packages
│   ├── ruby
│   │   ├── packaging
│   │   └── spec
│   └── greeter
│       ├── packaging
│       └── spec
└── src
```
