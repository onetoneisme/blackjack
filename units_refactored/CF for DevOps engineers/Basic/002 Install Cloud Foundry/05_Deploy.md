## Deploy

1. Upload the latest stemcell.
```
bosh upload stemcell https://bosh.io/d/stemcells/bosh-aws-xen-hvm-ubuntu-trusty-go_agent
```

2. Upload the Cloud Foundry release.
```
bosh upload release https://bosh.io/d/github.com/cloudfoundry/cf-release?v=236
```

3. Generate a deployment manifest.
```
scripts/generate_deployment_manifest aws cf-stub.yml > ~/deployment/cf.yml
```

4. Start deployment and have a coffee
```
bosh deployment ~/deployment/cf.yml
bosh deploy
```
