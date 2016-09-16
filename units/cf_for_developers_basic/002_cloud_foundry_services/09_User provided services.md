### User-provided services

A *user-provided service* is a neat way in which Cloud Foundry allows you to use external software (applications that aren't being managed in Cloud Foundry) and treat them just like any other CF managed service.

Let's say you have a MySQL database that is external to the Cloud Foundry deployment. Your application needs to connect to that database, so you need to provide the connection information and credentials. Hard coding that information is not only **discouraged**, but is actually very dangerous. A user provided service will provide your application with a way to connect to that service without having to change the way you get the connection information.
