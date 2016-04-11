### Rules evaluation sequence

Multiple security groups can be applied to a space or a security set. Any of those security groups can allow an outgoing message. Since the security groups rules define allowed traffic, the order of execution is not important, because Cloud Foundry merges the security groups applicable to the container and blocks all the traffic not allowed by the security groups rules.
