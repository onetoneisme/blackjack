## Create a job

```
bosh generate job elasticsearch
```

After executing this command, the filesystem tree should look like the following:

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
