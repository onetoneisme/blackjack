### Prerequisites

Before starting this lesson, plese create new org and space. Run cf `cf create-org my-org`, then run `cf target -o my-org` to get into your new org and `cf create-space my-first-space`. 

#### Structure

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

* **Protocol**: TCP, UPD, or ICMP
* **Destination**: an IP address or CIDR block
* **Ports**:
  * For TCP and UPD, a port to open or a port range
  * For ICMP, an ICMP type and code
