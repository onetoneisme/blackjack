### VIII. Concurrency
#### Scale out via the process model

Any computer program, once run, is represented by one or more processes. Web apps have taken a variety of process-execution forms. For example, PHP processes run as child processes of Apache, started on demand as needed by request volume. Java processes take the opposite approach, with the JVM providing one massive uberprocess that reserves a large block of system resources (CPU and memory) on startup, with concurrency managed internally via threads. In both cases, the running process(es) are only minimally visible to the developers of the app.

**In the twelve-factor app, processes are a first class citizen.** Processes in the twelve-factor app take strong cues from the _unix process model for running service daemons_. Using this model, the developer can architect their app to handle diverse workloads by assigning each type of work to a _process type_. For example, HTTP requests may be handled by a web process, and long-running background tasks handled by a worker process.

Scaling in CF is pretty simple. If you want to scale your application you need to execute command scale in CF client:

```sh
$ cf scale workshop-12f-stock -i 2
```
so we just scaled our application by addind the second machine.
Check scaling by accessing endpoing from the previous lesson several times http://workshop-12f-stock.cfapps.io/stock/factor7.
Make sure that in response you receive different IP addresses.