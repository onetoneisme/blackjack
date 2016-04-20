## Create the package

```
bosh generate package elasticsearch
```

After executing this command, the filesystem tree should look like the following:

```
○ → tree
.
├── blobs
├── config
│   └── blobs.yml
├── creating_this_bosh_release.md
├── jobs
│   └── elasticsearch
│       ├── monit
│       ├── spec
│       └── templates
│           ├── elasticsearch.yml.erb
│           └── elasticsearch_ctl
├── packages
│   └── elasticsearch
│       ├── packaging
│       ├── pre_packaging
│       └── spec
└── src
```
