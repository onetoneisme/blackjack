### Generate deployment manifest

1. Install spruce
```
cd ~
wget https://github.com/geofffranks/spruce/releases/download/v1.3.1/spruce-linux-amd64
chmod +x spruce-linux-amd64
sudo mv spruce-linux-amd64 /usr/local/bin/spruce
```

2. Check that spruce is installed correctly
```
spruce --version
``` 

3. Clone ELK release repository
```
cd ~
git clone https://github.com/logsearch/logsearch-boshrelease
cd logsearch-boshrelease
git checkout tags/v202.0.0
```

4. Save the following file as `~/deployment/elk-stub.yml` 

```
meta:
  stemcell:
    name: bosh-aws-xen-hvm-ubuntu-trusty-go_agent
    version: latest

releases:
- name: logsearch
  version: latest

name: logsearch
director_uuid: {{bosh status --uuid}}

jobs:
# Deploy group 1
- name: elasticsearch_master
  instances: 1

- name: cluster_monitor
  instances: 1
  properties:
    nats_to_syslog:
      nats:
        user: nats
        password: nats-password
        port: 4222
        machines: [10.0.0.6]

- name: queue
  instances: 1

- name: maintenance
  instances: 1

# Deploy group 2
- name: elasticsearch_data
  instances: 2

- name: kibana
  instances: 1

- name: ingestor
  instances: 1

- name: parser
  instances: 2

# Deploy group 3
- name: ls-router
  instances: 1
  networks:
  - (( merge ))
  - name: elastic
    static_ips:
    - {{source ~/deployment/vars && echo $elk_eip}}

disk_pools:
- name: elasticsearch_master
  disk_size: 102400
- name: elasticsearch_data
  disk_size: 512000
- name: queue
  disk_size: 102400
- name: cluster_monitor
  disk_size: 102400

networks:
- name: default
  type: manual
  subnets:
  - range: 10.0.1.0/24
    gateway: 10.0.1.1
    cloud_properties:
      subnet: {{source ~/deployment/vars && echo $elk_subnet_id}}
      security_groups: [elk_sg, training_sg]
    dns:
    - 10.10.0.2
    reserved:
    - 10.0.1.2 - 10.0.1.6
    static:
    - 10.0.1.10 - 10.0.1.40
- name: elastic
  type: vip
```


5. Save the following file as `~/deployment/elk-aws.yml` 

```
meta:
  stemcell:
    name: bosh-aws-xen-hvm-ubuntu-trusty-go_agent
    version: latest

compilation:
  cloud_properties:
    availability_zone: {{source ~/deployment/vars && echo $avz}}
    instance_type: c4.large

resource_pools:
- name: elasticsearch_master
  cloud_properties:
    availability_zone: {{source ~/deployment/vars && echo $avz}}
    instance_type: t2.micro

- name: elasticsearch_data
  cloud_properties:
    availability_zone: {{source ~/deployment/vars && echo $avz}}
    instance_type: t2.micro

- name: queue
  cloud_properties:
    availability_zone: {{source ~/deployment/vars && echo $avz}}
    instance_type: t2.small

- name: ingestor
  cloud_properties:
    availability_zone: {{source ~/deployment/vars && echo $avz}}
    instance_type: t2.micro

- name: parser
  cloud_properties:
    availability_zone: {{source ~/deployment/vars && echo $avz}}
    instance_type: t2.micro

- name: kibana
  cloud_properties:
    availability_zone: {{source ~/deployment/vars && echo $avz}}
    instance_type: t2.micro

- name: maintenance
  cloud_properties:
    availability_zone: {{source ~/deployment/vars && echo $avz}}
    instance_type: t2.micro

- name: cluster_monitor
  cloud_properties:
    availability_zone: {{source ~/deployment/vars && echo $avz}}
    instance_type: m4.large

- name: haproxy
  cloud_properties:
    availability_zone: {{source ~/deployment/vars && echo $avz}}
    instance_type: t2.micro

- name: errand
  cloud_properties:
    availabtily_zone: {{source ~/deployment/vars && echo $avz}}
    instance_type: t2.micro

disk_pools:
- name: elasticsearch_master
  cloud_properties:
    type: gp2

- name: elasticsearch_data
  cloud_properties:
    type: gp2

- name: queue
  cloud_properties:
    type: gp2

- name: cluster_monitor
  cloud_properties:
    type: gp2

```

6. Generate deplyment manifest
```
cd ~/logsearch-boshrelease
spruce merge --prune meta \
  "templates/logsearch-deployment.yml" \
  "templates/logsearch-jobs.yml" \
  ~/deployment/elk-aws.yml \
  ~/deployment/elk-stub.yml \
> ~/deployment/elk.yml
```

