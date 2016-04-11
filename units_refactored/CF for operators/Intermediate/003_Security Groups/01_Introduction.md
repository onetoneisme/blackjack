### ToC

1.	Introduction
2.	Security groups scopes
3.  Structure
4.  Creating security groups
5.  Binding security groups
6.  Viewing security groups
7.  Rules evaluation sequence

### Introduction

Security groups are a very convenient way to allow certain communications channels open for some services.
They work very much like a firewall to control outbound traffic from your deployed applications.

### Security groups scopes

Security groups can affect *spaces*, the **Default staging** or the **Default running** group set:

- Default Staging: Rules in this set are applied to every application staged anywhere in your CF deployment.
- Default Running: Rules in this set are applied to every application running anywhere in your CF deployment.

> **Remember**: Security created and assigned in a Cloud Foundry are **NOT** the same as infrastructure-level security groups.

### Structure

A security group consists of a predetermined structure, which is defined by a JSON object:

```js
[
  {
    "protocol":"tcp",
    "destination":"10.0.11.0/24",
    "ports":"3306"
  },
  {
    "protocol":"udp",
    "destination":"10.0.11.0/24",
    "ports":"2200-3000"
  }
]
```

The structure is defined by:

* **Protocol**: TCP, UPD or ICMP
* **Destination**: IP address or CIDR block.
* **Ports**:
  * For TCP and UPD, a port to open or a port range.
  * For ICMP, an ICMP type and code.
