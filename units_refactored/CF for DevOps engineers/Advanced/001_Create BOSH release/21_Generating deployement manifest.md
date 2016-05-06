### Generate the deployment manifest

Save the following as `~/deployment/greeter.yml`

```yaml
---
name: greeter-release
director_uuid: {{source ~/.profile && bosh status --uuid 2>/dev/null}}

releases:
- name: greeter-release
  version: latest

compilation:
  workers: 2
  network: private
  cloud_properties:
    instance_type: m3.xlarge
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
      - 10.0.0.1 - 10.0.0.100
    static:
      - 10.0.0.101
      - 10.0.0.102
      - 10.0.0.103
    cloud_properties:
      subnet: {{source deployment/vars && echo $subnet_id}}
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
    instance_type: m3.medium
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
    - 10.0.0.102
  properties: {}

- name: router
  templates:
  - name: router
  instances: 1
  resource_pool: infrastructure
  networks:
  - name: private
    static_ips:
    - 10.0.0.101
    default: [dns, gateway]
  - name: public
    static_ips:
    - {{source deployment/vars && echo $eip_router}}
  properties:
    upstreams:
      - 10.0.0.102:8080
```
