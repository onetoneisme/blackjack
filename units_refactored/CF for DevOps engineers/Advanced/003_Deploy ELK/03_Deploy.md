### Deploy

1. Upload release
    ```
    bosh upload release https://bosh.io/d/github.com/logsearch/logsearch-boshrelease?v=202.0.0
    ``` 

2. Upload stemcell
    ```
    bosh upload stemcell https://bosh.io/d/stemcells/bosh-aws-xen-hvm-ubuntu-trusty-go_agent
    ```

3. Deploy
    ```
    bosh -d ~/deployment/elk.yml deploy
    ```
