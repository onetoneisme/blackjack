### User provided services

A *user provided service* is a neat way that Cloud Foundry allows you to use external software (applications that aren't begin managed in Cloud Foundry) and treat then just like any other CF managed service.
Let's say that you have a MySQL database that is external to the Cloud Foundry deployment. Your application needs to connect to that database, so you need to provide the connection information and credentials. Hard coding that information is not only **not** adviced, but even very dangerous. A user provided service will provide your application with a way to connect to that service without having to change the way of getting the connection information.
