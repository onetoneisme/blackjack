#### Controlling resources when pushing

As you can see, pushing the application uses some default values such as the disk size and memory limits. To specify custom values, the CLI offers a series of modifiers:

```sh
cf push my-sinatra-app -k 128M -m 256M
```

This command will push your application again, but this time setting a disk size (`-k`) of 128M and a memory limit (`-m`) of 256M. You can get help on all the modifiers available to the `push` command by doing executing `cf help push`.

```
$ cf help push
NAME:
   push - Push a new app or sync changes to an existing app

ALIAS:
   p

USAGE:
   Push a single app (with or without a manifest):
   cf push APP_NAME [-b BUILDPACK_NAME] [-c COMMAND] [-d DOMAIN] [-f MANIFEST_PATH]
   [-i NUM_INSTANCES] [-k DISK] [-m MEMORY] [-n HOST] [-p PATH] [-s STACK] [-t TIMEOUT]
   [--no-hostname] [--no-manifest] [--no-route] [--no-start]

   Push multiple apps with a manifest:
   cf push [-f MANIFEST_PATH]


OPTIONS:
   -b                   Custom buildpack by name (e.g. my-buildpack) or GIT URL (e.g. 'https://github.com/heroku/heroku-buildpack-play.git') or GIT BRANCH URL (e.g. 'https://github.com/heroku/heroku-buildpack-play.git#develop' for 'develop' branch)
   -c                   Startup command, set to null to reset to default start command
   -d                   Domain (e.g. example.com)
   -f                   Path to manifest
   -i                   Number of instances
   -k                   Disk limit (e.g. 256M, 1024M, 1G)
   -m                   Memory limit (e.g. 256M, 1024M, 1G)
   -n                   Hostname (e.g. my-subdomain)
   -p                   Path to app directory or file
   -s                   Stack to use (a stack is a pre-built file system, including an operating system, that can run apps)
   -t                   Maximum time (in seconds) for CLI to wait for application start, other server side timeouts may apply
   --no-hostname        Map the root domain to this app
   --no-manifest        Ignore manifest file
   --no-route           Do not map a route to this app and remove routes from previous pushes of this app.
   --no-start           Do not start an app after pushing
   --random-route       Create a random route for this app
```
