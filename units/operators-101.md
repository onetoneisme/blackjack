# Operating Cloud Foundry

Cloud Foundry provides an API endpoint to perform different operations and interact seamlessly with the whole fondation.
To operate with Cloud Foundry (hereinafter "CF"), you must install the CLI client that connects to that API.

The CLI provides help. Try it by simply executing `cf` in the terminal.

## Connecting to the CF API

Using the CLI required to connect to the API CF, for the CLI to know where to send the commands.

This is done as follows:

```
cf api --skip-ssl-validation https://api.{{cf-get-instance-ip}}.xip.io
```

In the case of a successful connection, the following information will be displayed:

```
Setting api endpoint to https://api.{{cf-get-instance-ip}}.xip.io ...
OK
```

Now, you need to provide credentials. This is accomplished through interactive command `cf login`. For this training course,  use the `trainee_admin` / `admin` credentials.

## Create your first user

Before doing anything, you need to create a user, so we will not use the `trainee_admin` user after your user has been created.

Creating a user is as simple as:

```
cf create-user you_username "your_password"
```

## Create an Organization

Cloud Foundry's organizational structure allows the use of "Organizations" and "Spaces". Each *Org* and *Space*  can have multiple users assigned.
All applications, services and users will be binded to Orgs and Spaces, so you need to create at lease one Org to move forward:

```
cf create-org training
```

## Create a Space

Spaces are very useful for providing separation of concerns. For example, you can have "Dev", "Test" and "Staging" spaces in a single Cloud Foundry foundation.
To create a space, use the `cf create-space` command. Try it and see the help provided by the CLI. Create a space with your username in the org **training**.

After creating the space, use the command `cf target` for setting the CLI in the **training** org and the space that you just created.

```
cf target -o training -s [your_space]
```

## Set permissions to space

Now you need to add the necessary permissions for your user to use the Org and Space you have created:

```
cf set-space-role [your username] training [your space] SpaceDeveloper
```

Now that our user has already permits do deploy an application.
But first and foremost, autenticate with your credentials, you can be with `cf auth` or `cf login`.

## Deploy an application

First, clone this GitHub repository in your work directory:

```
git clone https://github.com/eljuanchosf/cf-sinatra-example
cd cf-sinatra-example
```

Deploying an application in CF involves using the `cf push` command. In this case, we will use the following format `cf push [your username]-app`
For example, if your user is `JoeDoe`, you will use:
```
cf-app push JoeDoe-app
```

CF will deploy the application and will show the URL to access the application, in this case, something like `http: // joedoe-app.{{cf-get-instance-ip}}.xip.io/`

## Viewing logs

To view logs for a given application, run the `cf logs` command. You will need to specify the application name as a parameter.

## Scaling

There are two ways to scale applications in CF: vertically and horizontally.
Us the `cf scale` command to try both scaling strategies:
* Vertically, by increasing the memory of the instance. Observe: what happens when changing the size of an instance?
* Horizontally, by adding more instances of the application. Observe: what difference can you find with vertical scallation strategy?

Next, reduce the instances of the application again to 1.
