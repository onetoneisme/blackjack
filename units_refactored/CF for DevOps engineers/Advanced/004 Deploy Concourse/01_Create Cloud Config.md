### Create Cloud Config

1. Save the follwing file as `~/deployment/cloud_config.yml`

```
azs:
- name: z1
  cloud_properties: {availability_zone: {{source deployment/vars && echo $avz}} }

vm_types:
- name: small
  cloud_properties:
    instance_type: t2.micro
    ephemeral_disk: {size: 3000, type: gp2}
- name: medium
  cloud_properties:
    instance_type: m3.medium
    ephemeral_disk: {size: 30000, type: gp2}

disk_types:
- name: small
  disk_size: 3000
  cloud_properties: {type: gp2}
- name: large
  disk_size: 50_000
  cloud_properties: {type: gp2}

networks:
- name: bosh
  type: manual
  subnets:
  - range: 10.10.0.0/24
    gateway: 10.10.0.1
    az: z1
    static: [10.10.0.62]
    dns: [10.10.0.2]
    cloud_properties: {subnet: {{source deployment/vars && echo $subnet_id}} }
- name: concourse
  type: manual
  subnets:
  - range: 10.10.2.0/24
    gateway: 10.10.2.1
    az: z1
    static: [10.10.2.62]
    dns: [10.10.2.2]
    cloud_properties: 
      subnet: {{source deployment/vars && echo $concource_subnet_id}} 
      security_groups: [training_sg]
- name: vip
  type: vip

compilation:
  workers: 5
  reuse_compilation_vms: true
  az: z1
  vm_type: medium
  network: private
```

2.  Update director Cloud Config

```
bosh update cloud-config ~/deployment/cloud_config.yml
```