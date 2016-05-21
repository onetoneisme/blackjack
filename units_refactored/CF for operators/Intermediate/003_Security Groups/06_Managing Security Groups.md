### Managing security groups

#### Updating

To update a security group, use the following command:
```sh
cf update-security-group SECURITY_GROUP_NAME FILE_PATH
```

This will update an existing security group with the new rules.

#### Deleting a security group

`cf delete-security-group SECURITY_GROUP_NAME` will delete a security group. Remember that to delete a security group, you must first unbind it.

#### Unbinding and deleting

The CLI offers several commands for unbinding and deleting security groups:

- `cf unbind-security-group SECURITY_GROUP_NAME ORG SPACE` will unbind a security group from a space
- `cf unbind-staging-security-group SECURITY_GROUP_NAME` will unbind a security group from the set of security groups for staging applications
- `cf unbind-running-security-group SECURITY_GROUP_NAME` will unbind a security group from the set of security groups for running applications

#### Try it

Let's unbind the security group we have created and then delete it:

1. `cf unbind-security-group mysql-sg my-org my-first-space`
2. `cf delete-security-group mysql-sg`
