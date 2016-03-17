### What is the UAAC?

The UAA (User Authentication \& Authorization) is a multi-tenant identity management service used in Cloud Foundry. Its primary role is as an OAuth2 provider, issuing tokens for client applications to use when they act on behalf of Cloud Foundry users. It can also authenticate users with their Cloud Foundry credentials, and can act as an SSO service using those credentials (or others). It has endpoints for managing user accounts and for registering OAuth2 clients, as well as various other management functions.

The UAA**C** is the UAA CLI, which provides a wrapper over the UAA exposed API.

#### Why is it necessary?

Cloud Foundry's CLI only provides very basic UAA actions, such as create and delete users and assign permissions to orgs and spaces.
The UAAC allows much more complex operations, such as general and specific user roles and permissions system-wide.

#### More info

If you want to go deep after the lessons, you can explore the [UAAC GitHub repository](https://github.com/cloudfoundry/cf-uaac), which contains lots of resources and information.
