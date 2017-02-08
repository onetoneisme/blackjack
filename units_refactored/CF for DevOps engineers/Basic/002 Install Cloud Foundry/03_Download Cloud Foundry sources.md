## Download Cloud Foundry sources

1. Install Git.
  ```
  sudo apt-get install git -y
  ```

2. Clone the CF release repository.
  ```
  git clone https://github.com/cloudfoundry/cf-release --branch v236 ~/deployment/cf-release
  cd ~/deployment/cf-release
  ```

3. Patch the CF templates in order to use a ha_proxy job, decrease number of instances and use only one availability zone instead of two.

  Create the `instances.patch` file with the following content:

  ```
    diff --git a/templates/cf-infrastructure-aws.yml b/templates/cf-infrastructure-aws.yml
  index e31924f0..29bb7dc4 100644
  --- a/templates/cf-infrastructure-aws.yml
  +++ b/templates/cf-infrastructure-aws.yml
  @@ -161,7 +161,7 @@ jobs:
           static_ips: (( static_ips(1) ))
  
     - name: nats_z2
  -    instances: 1
  +    instances: 0
       networks:
         - name: cf2
           static_ips: (( static_ips(1) ))
  @@ -173,7 +173,7 @@ jobs:
           static_ips: (( static_ips(5, 6, 15, 16, 17, 18, 19, 20) ))
  
     - name: router_z2
  -    instances: 1
  +    instances: 0
       networks:
         - name: cf2
           static_ips: (( static_ips(5, 6, 15, 16, 17, 18, 19, 20) ))
  @@ -194,7 +194,7 @@ jobs:
         - name: cf1
  
     - name: doppler_z2
  -    instances: 1
  +    instances: 0
       networks:
         - name: cf2
  
  @@ -204,7 +204,7 @@ jobs:
         - name: cf1
  
     - name: loggregator_trafficcontroller_z2
  -    instances: 1
  +    instances: 0
       networks:
         - name: cf2
  
  @@ -215,7 +215,7 @@ jobs:
           static_ips: (( static_ips(27, 28, 29) ))
  
     - name: consul_z2
  -    instances: 1
  +    instances: 0
       networks:
         - name: cf2
           static_ips: (( static_ips(27, 28, 29) ))
  @@ -227,7 +227,7 @@ jobs:
           static_ips: (( static_ips(10, 25) ))
  
     - name: etcd_z2
  -    instances: 1
  +    instances: 0
       networks:
         - name: cf2
           static_ips: (( static_ips(9) ))
  diff --git a/templates/cf.yml b/templates/cf.yml
  index 0f941c8d..875c4bcc 100644
  --- a/templates/cf.yml
  +++ b/templates/cf.yml
  @@ -29,7 +29,7 @@ jobs:
  
     - name: consul_z2
       templates: (( merge || meta.consul_templates ))
  -    instances: 1
  +    instances: 0
       persistent_disk: 1024
       resource_pool: small_z2
       default_networks:
  @@ -78,7 +78,7 @@ jobs:
  
     - name: nats_z2
       templates: (( merge || meta.nats_templates ))
  -    instances: 1
  +    instances: 0
       resource_pool: medium_z2
       networks:
         - name: cf2
  @@ -105,7 +105,7 @@ jobs:
  
     - name: etcd_z2
       templates: (( merge || meta.etcd_templates ))
  -    instances: 1
  +    instances: 0
       persistent_disk: 10024
       resource_pool: medium_z2
       networks:
  @@ -202,7 +202,7 @@ jobs:
  
     - name: uaa_z2
       templates: (( merge || meta.uaa_templates ))
  -    instances: 1
  +    instances: 0
       resource_pool: medium_z2
       networks:
         - name: cf2
  @@ -240,7 +240,7 @@ jobs:
  
     - name: api_z2
       templates: (( merge || meta.api_templates ))
  -    instances: 1
  +    instances: 0
       resource_pool: large_z2
       persistent_disk: 0
       networks:
  @@ -283,7 +283,7 @@ jobs:
  
     - name: api_worker_z2
       templates: (( merge || meta.api_worker_templates ))
  -    instances: 1
  +    instances: 0
       resource_pool: small_z2
       persistent_disk: 0
       networks:
  @@ -313,7 +313,7 @@ jobs:
  
     - name: hm9000_z2
       templates: (( merge || meta.hm9000_templates ))
  -    instances: 1
  +    instances: 0
       resource_pool: medium_z2
       networks:
         - name: cf2
  @@ -354,7 +354,7 @@ jobs:
  
     - name: runner_z2
       templates: (( merge || meta.dea_templates ))
  -    instances: 1
  +    instances: 0
       resource_pool: runner_z2
       networks:
         - name: cf2
  @@ -417,7 +417,7 @@ jobs:
  
     - name: doppler_z2
       templates: (( merge || meta.loggregator_templates ))
  -    instances: 1
  +    instances: 0
       resource_pool: medium_z2
       networks:
         - name: cf2
  @@ -445,7 +445,7 @@ jobs:
  
     - name: loggregator_trafficcontroller_z2
       templates: (( merge || meta.loggregator_trafficcontroller_templates ))
  -    instances: 1
  +    instances: 0
       resource_pool: small_z2
       networks:
         - name: cf2
  @@ -477,7 +477,7 @@ jobs:
  
     - name: router_z2
       templates: (( merge || meta.router_templates ))
  -    instances: 1
  +    instances: 0
       resource_pool: router_z2
       default_networks:
         - name: cf2
  ```

4. Apply the patch
  ```
  git apply instances.patch
  ```
