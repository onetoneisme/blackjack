### Create the job spec

Edit the file `jobs/elasticsearch/spec` and replace the existing content with the following:

```
---
name: elasticsearch
templates:
  elasticsearch_ctl: bin/elasticsearch_ctl
  elasticsearch.yml.erb: config/elasticsearch.yml

packages:
- java
- elasticsearch

properties:
  elasticsearch.cluster:
    description: The name of the cluster
  elasticsearch.ping_hosts:
    description: The hosts used for cluster discovery
    default: []
```
