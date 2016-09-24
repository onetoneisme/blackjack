### Table of contents

1.	Introduction
2.	Listing quotas
3.	Getting quota info
4.	Creating and managing quotas
5.	Assigning quotas
6.	Space quotas

### Introduction

*How do you manage resources in Cloud Foundry?*

That is a very common question that has a very good answer.

Cloud Foundry offers a convenient way to manage available resources, such as disk, memory, and even paid services. This is done through **Quotas** or namesets, which are an easy way to remember a configuration for a specific resource management plan.

The structure of a quota is comprised of the following:

-	**name**: a name you will use to identify the plan; it should be easy to remember
-	**instance memory limit**: the maximum amount of memory that an instance can use, e.g., `256M` or `2G`
-	**memory limit**: the maximum amount of memory allowed to be used in the plan, e.g., `512M` or `1G`
-	**total routes**: the maximum number of routes allowed for the plan
-	**total services**: the maximum number of services allowed in the plan
-	**non basic services allowed**: setting this value to `true` will allow users to provision non-free service plans
