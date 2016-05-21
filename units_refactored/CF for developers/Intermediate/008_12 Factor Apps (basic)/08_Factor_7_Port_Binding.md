### VII. Port binding
#### Export services via port binding

Web apps are sometimes executed inside a Web server container. For example, PHP apps might run as a module inside Apache HTTPD, or Java apps might run inside Tomcat.

**The twelve-factor app is completely self-contained** and does not rely on runtime injection of a Web server into the execution environment to create a Web-facing service. The Web app **exports HTTP as a service by binding to a port** and listening to requests coming in on that port.

In a local development environment, the developer visits a service URL, like `http://localhost:5000/`, to access the service exported by their app. In a deployment, the routing layer handles routing requests from a public-facing hostname to the port-bound Web processes.

This is typically implemented, using dependency declaration to add a Web server library to the app, such as Tornado for Python, Thin for Ruby, or Jetty for Java and other JVM-based languages. This happens entirely inside the user space, that is, within the app’s code. The contract with the execution environment is binding to a port to serve requests.

HTTP is not the only service that can be exported by port binding. Nearly any kind of server software can be run via a process binding to a port and awaiting incoming requests. Examples include ejabberd (speaking XMPP), and Redis (speaking the Redis protocol).

You should also note that the port-binding approach means one app can become the backing service for another app, if the URL to the backing app is provided as a resource handle in the config for the consuming app.

Ok, now let's add the following endpoint to `StockResource` class:

```
    @RequestMapping("/factor7")
    public String factor7() {
        return " From ip " + environment.getProperty("CF_INSTANCE_IP")
                + " and ports " + environment.getProperty("CF_INSTANCE_PORTS");
    }
```

Build and push the application:

```
$ mvn clean install
$ cf push
```

Access this endpoint (`http://workshop-12f-stock.cfapps.io/stock/factor7`) and note the machine IP address and port provided by CF in the response.