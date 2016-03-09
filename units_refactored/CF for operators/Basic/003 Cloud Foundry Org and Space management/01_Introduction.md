### Objectives

### ToC

1. Introduction
2. Managing Organizations
3. Managing Spaces

### Introduction

Cloud Foundry provides, out of the box, a powerful Role Based Access Control (RBAC) system that will help you organize, secure and provide flexible configurations for deploying applications and services.

To understand a little bit more about Orgs, Spaces and Roles, the [official documentation](https://docs.cloudfoundry.org/concepts/roles.html) has a very good introduction.

At an overview, the structure can be defined as:

```
Organization(s)
|
--- Space(s)
    |
    --- User(s) < (permissions/roles)
        |
        --- Application(s)
```

In short, Cloud Foundry has one or many organizations, which in turn have one or many spaces that have one or many users that have permissions, and the users deploy or target applications in the spaces assigned.

This simple, yet flexible organizational structure will allow you to adapt Cloud Foundry to your company needs.

For now, we will focus on Organizations and Spaces, and later on we will work with users and permissions.
