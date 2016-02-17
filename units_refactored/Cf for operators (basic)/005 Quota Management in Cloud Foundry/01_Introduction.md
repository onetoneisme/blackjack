### ToC

1.	Introduction
2.	Listing quotas
3.	Getting quota info
4.	Creating and managing quotas
5.	Assigning quotas
6.	Space quotas

### Introduction

*How do you manage resources in Cloud Foundry?*

That is a very common question that has a very good answer.

Cloud Foundry offers a very convenient way of managing available resources such as disk, memory and even paid services. This is done through **Quotas**, or namesets that are easy way to remember a configuration for an specific resource management plan.

A quota structure is comprised of:

-	**name**: a name you will use to identify the plan. Should be easy to remember.
-	**instance memory limit**: the maximum amount of memory that an instance can use. Examples: `256M`, `2G`.
-	**memory limit**: the maximum amount of memory usage allowed in the plan. Examples: `512M`, `1G`.
-	**total routes**: the maximum amount of routes allowed for the plan.
-	**total services**: the maximum amount of services allowed in the plan.
-	**non basic services allowed**: setting this value to `true` will allow users to provision non-free service plans.
