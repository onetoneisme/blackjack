### Using CF_TRACE

At the moment of deploying applications or sending commands to Cloud Foundry, sometimes you will need to take a look on what is going on with your requests.
The CLI provides a mode in which all the requests are shown as output. Basically, a **very** verbose mode.

To try this mode, add the `CF_TRACE=true` environment value to the command line:

Try it!

```sh
CF_TRACE=true cf orgs
```

Output should be something like:


```
$ CF_TRACE=true cf orgs

VERSION:
6.10.0-b78bf10

Getting orgs as my-user...

.
[LOTS of output!]
.

name
my-org
```

This "ultra verbose mode" is useful to diagnose issues with any command you might send to Cloud Foundry.
As you can see, there is a lot of output. The CLI has a handy convention to solve this issue:

```sh
export CF_TRACE=/path/to/outputfile.txt
```

This will output all the trace from all the CLI commands to the specified file.
