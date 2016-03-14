## Deploy Cloud Foundry

1. Upload the new stemcell
```
bosh upload stemcell https://bosh.io/d/stemcells/bosh-aws-xen-hvm-ubuntu-trusty-go_agent?v=3202
```

2. Upload the latest stable version of Cloud Foundry
```
bosh upload release https://bosh.io/d/github.com/cloudfoundry/cf-release
```

3. Set the BOSH deployment
```
bosh deployment ~/deployment/minimal-aws.yml
```

4. Deploy
```
bosh deploy
```
