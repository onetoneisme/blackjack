#### Security groups scopes

Security groups can affect *spaces*, the **Default Staging**, or the **Default Running** group set:

- *Default Staging*: Rules in this set are applied to every application staged anywhere in your CF deployment.
- *Default Running*: Rules in this set are applied to every application running anywhere in your CF deployment.

> **Remember**: Security groups created and assigned in a Cloud Foundry deployment are **NOT** the same as infrastructure-level security groups.

#### Rules evaluation sequence

Multiple security groups can be applied to a space or a security set. Any of those security groups can allow an outgoing message. Since the security group rules define allowed traffic, the order of execution is not important, because Cloud Foundry merges the security groups applicable to the container and blocks all the traffic not allowed by the security group rules.
