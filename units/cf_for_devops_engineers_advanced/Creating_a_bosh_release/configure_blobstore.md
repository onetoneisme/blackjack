### Configure the blobstore

Save the following file as `~/greeter-release/config/final.yml`:

```file=~/greeter-release/config/final.yml
---
final_name: greeter-release
blobstore:
  provider: local
  options:
    blobstore_path: /tmp/bosh-blobstore
```
