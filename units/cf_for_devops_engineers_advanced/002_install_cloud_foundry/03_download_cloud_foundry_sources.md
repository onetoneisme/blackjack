## Download Cloud Foundry sources

1. Install Git.
  ```
  sudo apt-get install git -y
  ```

2. Clone the CF release repository.
  ```
  git clone https://github.com/cloudfoundry/cf-release ~/deployment/cf-release
  cd ~/deployment/cf-release
  git checkout v236
  ```

3. Patch the CF templates in order to use a ha_proxy job, decrease number of instances and use only one availability zone instead of two.

  Create the `instances.patch` file with the following content:

```
diff --git a/templates/cf-infrastructure-aws.yml b/templates/cf-infrastructure-aws.yml
index e31924f..fb2e501 100644
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

@@ -204,30 +204,30 @@ jobs:
       - name: cf1

   - name: loggregator_trafficcontroller_z2
-    instances: 1
+    instances: 0
     networks:
       - name: cf2

   - name: consul_z1
-    instances: 2
+    instances: 1
     networks:
       - name: cf1
         static_ips: (( static_ips(27, 28, 29) ))

   - name: consul_z2
-    instances: 1
+    instances: 0
     networks:
       - name: cf2
         static_ips: (( static_ips(27, 28, 29) ))

   - name: etcd_z1
-    instances: 2
+    instances: 1
     networks:
       - name: cf1
         static_ips: (( static_ips(10, 25) ))

   - name: etcd_z2
-    instances: 1
+    instances: 0
     networks:
       - name: cf2
         static_ips: (( static_ips(9) ))
diff --git a/templates/cf.yml b/templates/cf.yml
index 0f941c8..c6b2cc3 100644
--- a/templates/cf.yml
+++ b/templates/cf.yml
@@ -10,7 +10,7 @@ networks: (( merge ))
 jobs:
   - name: consul_z1
     templates: (( merge || meta.consul_templates ))
-    instances: 2
+    instances: 1
     persistent_disk: 1024
     resource_pool: small_z1
     default_networks:
@@ -29,7 +29,7 @@ jobs:

   - name: consul_z2
     templates: (( merge || meta.consul_templates ))
-    instances: 1
+    instances: 0
     persistent_disk: 1024
     resource_pool: small_z2
     default_networks:
@@ -48,7 +48,7 @@ jobs:

   - name: ha_proxy_z1
     templates: (( merge || meta.ha_proxy_templates ))
-    instances: 0
+    instances: 1
     resource_pool: router_z1
     default_networks:
       - name: cf1
@@ -78,7 +78,7 @@ jobs:

   - name: nats_z2
     templates: (( merge || meta.nats_templates ))
-    instances: 1
+    instances: 0
     resource_pool: medium_z2
     networks:
       - name: cf2
@@ -90,7 +90,7 @@ jobs:

   - name: etcd_z1
     templates: (( merge || meta.etcd_templates ))
-    instances: 2
+    instances: 1
     persistent_disk: 10024
     resource_pool: medium_z1
     networks:
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
