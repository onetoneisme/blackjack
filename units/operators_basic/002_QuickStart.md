# Operating Cloud Foundry

###What you are going to learn:

- Connect to a Cloud Foundry foundation
- Create users
- Create Organizations and Spaces
- Assign permissions
- Target an Organization and Space
- Deploy a very simple application
- Scale up and down an application

## Connecting to the CF API

Cloud Foundry provides an API endpoint to perform different operations and interact seamlessly with the whole foundation.

Using the CLI requires to connect to the API CF, for the CLI to know where to send the commands.

To connect to Cloud Foundry's API, you need to use the `cf api` command.

```
cf api --skip-ssl-validation https://api.{{cf-get-instance-ip}}.xip.io
```

In the case of a successful connection, the following information will be displayed:

```
Setting api endpoint to https://api.{{cf-get-instance-ip}}.xip.io ...
OK
```

> 
**Important**: we are using `--skip-ssl-validation` since the Cloud Foundry deployment we are using for this course doesn't have a SSL certificate installed, but as a good practice for development and testing, and mandatory for production, a SSL cert should always be present.
>

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

If you want to know more about Cloud Foundry's permissions and roles, go to the [Cloud Foundry's official documentation](https://docs.cloudfoundry.org/concepts/roles.html#roles).

## Target your Org and Space

Target an Org and a Space means that all operations you will be doing will be performed in that Org and Space.

This is done by using the `cf target` command.

```
cf target -o training -s [your space]
```

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