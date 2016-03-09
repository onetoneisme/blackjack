## Creating java package

```
bosh generate package java
```

After executing this command file system tree should look like the following:

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
│   └── java
│       ├── packaging
│       ├── pre_packaging
│       └── spec
└── src
```
