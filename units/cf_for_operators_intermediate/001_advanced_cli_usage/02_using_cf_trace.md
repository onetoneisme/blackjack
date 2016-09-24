### Using `CF_TRACE`

When deploying applications or sending commands to Cloud Foundry, sometimes, you will need to take a look at what is going on with your requests.
The CLI provides a mode in which all the requests are shown as output. Basically, a **very** verbose mode.

To enable this mode, add the `CF_TRACE=true` environment value to the command line. Try it!

```sh
CF_TRACE=true cf orgs
```

The output should be something like:


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

This "ultra verbose mode" is useful when diagnosing issues with any command you might send to Cloud Foundry.
As you can see, there is a lot of output. The CLI has a handy convention to solve this issue, as well:

```sh
export CF_TRACE=/path/to/outputfile.txt
```

This will output all the trace from all the CLI commands to the specified file.
