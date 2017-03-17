### Generate the deployment manifest

Save the following as `~/deployment/greeter.yml`:

```file=~/deployment/greeter.yml
---
name: greeter-release
director_uuid: {{source .profile && bosh status --uuid}}

releases:
- name: greeter-release
  version: latest

compilation:
  workers: 4
  network: private
  cloud_properties:
    instance_type: m4.large
    availability_zone: {{source deployment/vars && echo $avz}}

update:
  canaries: 1
  canary_watch_time: 30000
  update_watch_time: 30000
  max_in_flight: 1
  max_errors: 1

networks:
- name: private
  type: manual
  subnets:
  - range: 10.0.0.0/24
    gateway: 10.0.0.1
    dns:
      - 8.8.8.8
      - 8.8.4.4
    reserved:
      - 10.0.0.1 - 10.0.0.6
    static:
      - 10.0.0.7
      - 10.0.0.8
    cloud_properties:
      subnet: {{source deployment/vars && echo $subnet_id}}
      security_groups: [greeter, bosh]
- name: public
  type: vip

resource_pools:
- name: infrastructure
  size: 4
  stemcell:
    name: bosh-aws-xen-hvm-ubuntu-trusty-go_agent
    version: latest
  network: private
  cloud_properties:
    instance_type: t2.small
    availability_zone: {{source deployment/vars && echo $avz}}

jobs:
- name: app
  templates:
  - name: app
  instances: 1
  resource_pool: infrastructure
  networks:
  - name: private
    static_ips: 
    - 10.0.0.7
  properties: {}

- name: router
  templates:
  - name: router
  instances: 1
  resource_pool: infrastructure
  networks:
  - name: private
    static_ips:
    - 10.0.0.8
    default: [dns, gateway]
  - name: public
    static_ips:
    - {{source deployment/vars && echo $eip_greeter}}
  properties:
    upstreams:
      - 10.0.0.7:8080
```
