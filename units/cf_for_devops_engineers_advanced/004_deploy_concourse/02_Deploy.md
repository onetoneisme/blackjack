### Deploy

1. Save the following file as `~/deployment/concourse.yml`
    ```
    ---
    name: concourse

    # replace with `bosh status --uuid`
    director_uuid: {{bosh status --uuid}}

    releases:
    - name: concourse
      version: latest
    - name: garden-linux
      version: latest

    stemcells:
    - alias: trusty
      os: ubuntu-trusty
      version: latest

    instance_groups:
    - name: web
      instances: 1
      vm_type: medium
      stemcell: trusty
      azs: [z1]
      networks: 
      - name: concourse
        default: [dns, gateway]
      - name: vip
        static_ips: [{{source ~/deployment/vars && echo $concourse_eip}}]
      jobs:
      - name: atc
        release: concourse
        properties:
          # replace with your CI's externally reachable URL, e.g. https://ci.foo.com
          external_url: http://{{source ~/deployment/vars && echo $concourse_eip}}.xip.io:8080

          # replace with username/password, or configure GitHub auth
          basic_auth_username: admin
          basic_auth_password: admin

          postgresql_database: &atc_db atc
      - name: tsa
        release: concourse
        properties: {}

    - name: db
      instances: 1
      vm_type: medium
      stemcell: trusty
      persistent_disk_type: large
      azs: [z1]
      networks: [{name: concourse}]
      jobs:
      - name: postgresql
        release: concourse
        properties:
          databases:
          - name: *atc_db
            # make up a role and password
            role: consource
            password: password

    - name: worker
      instances: 1
      vm_type: medium
      stemcell: trusty
      azs: [z1]
      networks: [{name: concourse}]
      jobs:
      - name: groundcrew
        release: concourse
        properties: {}
      - name: baggageclaim
        release: concourse
        properties: {}
      - name: garden
        release: garden-linux
        properties:
          garden:
            listen_network: tcp
            listen_address: 0.0.0.0:7777

    update:
      canaries: 1
      max_in_flight: 1
      serial: false
      canary_watch_time: 1000-60000
      update_watch_time: 1000-60000
    ```


2. Upload releases
    ```
    bosh upload release https://bosh.io/d/github.com/concourse/concourse?v=1.2.0
    bosh upload release https://bosh.io/d/github.com/cloudfoundry-incubator/garden-linux-release?v=0.337.0
    ``` 

3. Upload stemcell
    ```
    bosh upload stemcell https://bosh.io/d/stemcells/bosh-aws-xen-hvm-ubuntu-trusty-go_agent
    ```

4. Deploy
    ```
    bosh -d ~/deployment/concourse.yml deploy
    ```
