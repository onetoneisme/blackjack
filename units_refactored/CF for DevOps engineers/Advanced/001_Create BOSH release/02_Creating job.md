## Creating job 

```
bosh generate job elasticsearch
```

After executing this command file system tree should look like the following:

```
  ○ → tree
  .
  ├── blobs
  ├── config
  │   └── blobs.yml
  ├── jobs
  │   └── elasticsearch
  │       ├── monit
  │       ├── spec
  │       └── templates
  ├── packages
  └── src
```
