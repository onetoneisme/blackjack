## Generate deplyment manifest

Save the following file as `~/deployment/elasticsearch.yml`

```
---
name: elasticsearch
director_uuid: {{source ~/.profile && bosh status --uuid 2>/dev/null}} 

release:
  name: elasticsearch
  version: 1.0

compilation:
  workers: 2
  network: default
  cloud_properties:
    instance_type: m3.medium
    availability_zone: {{source deployment/vars && echo $avz}}

# this section describes how updates are handled
update:
  canaries: 1
  canary_watch_time: 30000
  update_watch_time: 30000
  max_in_flight: 1
  max_errors: 1

networks:

- name: default
  type: manual
  subnets:
  - range: 10.0.0.0/24
    gateway: 10.0.0.1
    dns: [10.0.0.2]
    reserved: [ '10.0.0.2 - 10.0.0.30' ]
    static:   [ '10.0.0.31 - 10.0.0.32' ]
    cloud_properties:
      subnet: {{source deployment/vars && echo $subnet_id}} 

resource_pools:

- name: infrastructure
  network: default
  size: 4
  stemcell:
    name: bosh-aws-xen-hvm-ubuntu-trusty-go_agent
    version: latest
  cloud_properties:
    instance_type: m3.medium
    availability_zone: {{source deployment/vars && echo $avz}}

jobs:

- name: elasticsearch
  template: elasticsearch
  persistent_disk: 2048
  instances: 2
  resource_pool: infrastructure 
  networks:
  - name: default
    static_ips: &ping_hosts
    - 10.0.0.31
    - 10.0.0.32

- name: elasticsearch-dynamic
  template: elasticsearch
  persistent_disk: 2048
  instances: 2
  resource_pool: infrastructure 
  networks:
  - name: default

properties:

  elasticsearch:
    cluster: my-awesome-cluster
    ping_hosts: *ping_hosts
```
