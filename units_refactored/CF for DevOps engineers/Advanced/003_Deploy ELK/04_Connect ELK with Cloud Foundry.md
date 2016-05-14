### Connect ELK with Cloud Foundry

1. Clone logsearch for Cloud Foundry repository
```
cd ~
git clone https://github.com/cloudfoundry-community/logsearch-for-cloudfoundry
```

2. Save the following file as `~/deployment/cf-elk-stub.yml`

```
releases:
- (( merge ))
- name: logsearch-for-cloudfoundry
  version: latest

jobs:
- name: ingestor
  templates:
  - (( merge ))
  - {name: ingestor_cloudfoundry-firehose, release: logsearch-for-cloudfoundry}
  properties:
    cloudfoundry:
      api_endpoint: http://api.{{echo $CF_DOMAIN}}
      doppler_endpoint: ws://doppler.{{echo $CF_DOMAIN}}
      firehose_user: admin
      firehose_password: admin
      skip_ssl_validation: true
    syslog:
      host: {{osh vms | grep ingestor | awk '{print $11}'}}
      port: 5514

- name: parser
  templates:
  - (( merge ))
  - {name: logsearch-for-cloudfoundry-filters, release: logsearch-for-cloudfoundry}
  properties:
    logstash_parser:
      filters:
      - logsearch-for-cf: /var/vcap/packages/logsearch-for-cloudfoundry-filters/logstash-filters-default.conf
``` 

3. Generate new deployment manifest
```
cd ~/logsearch-for-cloudfoundry
scripts/generate_deployment_manifest ~/deployment/elk.yml ~/deployment/cf-elk-stub.yml > ~/deployment/cf-elk.yml
```

4 .Upload release to director.
```
cd ~/logsearch-for-cloudfoundry
bosh create release
bosh upload release
``` 

5. Deploy
```
bosh -d ~/deployment/cf-elk.yml deploy
```
