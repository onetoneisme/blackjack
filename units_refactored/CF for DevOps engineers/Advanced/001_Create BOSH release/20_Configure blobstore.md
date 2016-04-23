### Configure blobstore

Save the following file as `config/final.yml`

```yaml
---
final_name: greeter-release
blobstore:
  provider: local
  options:
    blobstore_path: /tmp/bosh-blobstore
```
