## Create the postgresql security group

1. Create the `~/deployment/postgresql.json` file with the following content:
  ```json
  [
    {
      "destination": "0.0.0.0/0",
      "ports": "5432",
      "protocol": "tcp"
    }
  ]
  ```

1. Create the **postgresql** security group.
  ```
  cf create-security-group postgresql ~/deployment/postgresql.json
  ```

1. Bind the security group to your ORG and SPACE
  ```
  cf bind-security-group postgresql {{ cf target | grep ^Org: | awk '{print $2}' }} {{ cf target | grep ^Space: | awk '{print $2}' }}
  ```
