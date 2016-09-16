### Objectives

### Table of contents

1. Introduction
2. Managing organizations
3. Managing spaces

### Introduction

Out-of-the-box Cloud Foundry provides a powerful Role Based Access Control (RBAC) system that will help you to organize, secure, and provide flexible configurations for deploying applications and services.

To understand a little bit more about Orgs, Spaces, and Roles, you can read the [official documentation](https://docs.cloudfoundry.org/concepts/roles.html), which has a very good introduction.

In general, the structure can be defined as follows:

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

This simple, yet flexible organizational structure will allow you to adapt Cloud Foundry to your company's needs.

For now, we will focus on Organizations and Spaces, and later on, we will work with users and permissions.
