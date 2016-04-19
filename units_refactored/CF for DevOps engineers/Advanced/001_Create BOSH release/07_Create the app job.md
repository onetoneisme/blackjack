## Create the app job

```
bosh generate job app
```

After executing this command file system tree should look like the following:

```
  ○ → tree
  .
  ├── blobs
  ├── config
  │   └── blobs.yml
  ├── jobs
  │   ├── router
  │   │   ├── monit
  │   │   ├── spec
  │   │   └── templates
  │   └── app
  │       ├── monit
  │       ├── spec
  │       └── templates
  ├── packages
  └── src
```
