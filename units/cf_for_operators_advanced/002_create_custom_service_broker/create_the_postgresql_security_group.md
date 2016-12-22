## Create the postgresql security group

1. Create the `~/deployment/postgresql.json` file with the following content:
  ```file=~/deployment/postgresql.json
  [
    {
      "destination": "0.0.0.0/0",
      "ports": "5432",
      "protocol": "tcp"
    }
  ]
  ```

1. Create the **postgresql** security group.
  ```exec
  cf create-security-group postgresql ~/deployment/postgresql.json
  ```

1. Bind the security group to your ORG and SPACE
  ```exec
  cf bind-security-group postgresql {{ cf target | grep ^Org: | awk '{print $2}' }} {{ cf target | grep ^Space: | awk '{print $2}' }}
  ```
