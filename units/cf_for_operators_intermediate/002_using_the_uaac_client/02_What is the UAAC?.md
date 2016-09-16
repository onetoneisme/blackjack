### What is the UAAC?

The UAA (User Authentication \& Authorization) is a multi tenant identity management service used in Cloud Foundry. Its primary role is to serve as an OAuth2 provider, issuing tokens for client applications to use when they act on behalf of Cloud Foundry users. It can also authenticate users with their Cloud Foundry credentials and act as an SSO service, using those (or other) credentials. The UAA has endpoints for managing user accounts and for registering OAuth2 clients, as well as various other management functions.

The UAA**C** is the UAA CLI, which provides a wrapper for API exposed by the UAA.

#### Why is it necessary?

Cloud Foundry's CLI only provides very basic UAA actions, such as creating and deleting users and assigning permissions to orgs and spaces.
The UAAC allows for much more complex operations, such as general and specific system-wide user roles and permissions.

#### More info about the UAAC

If you'd like to go deeper into the UAAC, after completing all the lessons, you can explore the [UAAC GitHub repository](https://github.com/cloudfoundry/cf-uaac), which contains a lot of useful resources and information.
