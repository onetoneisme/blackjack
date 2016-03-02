### XI. Logs
#### Treat logs as event streams

_Logs_ provide visibility into the behavior of a running app. In server-based environments they are commonly written to a file on disk (a “logfile”); but this is only an output format.

Logs are the stream of aggregated, time-ordered events collected from the output streams of all running processes and backing services. Logs in their raw form are typically a text format with one event per line (though backtraces from exceptions may span multiple lines). Logs have no fixed beginning or end, but flow continuously as long as the app is operating.

**A twelve-factor app never concerns itself with routing or storage of its output stream.** It should not attempt to write to or manage logfiles. Instead, each running process writes its event stream, unbuffered, to ```stdout```. During local development, the developer will view this stream in the foreground of their terminal to observe the app’s behavior.

In staging or production deploys, each process’ stream will be captured by the execution environment, collated together with all other streams from the app, and routed to one or more final destinations for viewing and long-term archival. These archival destinations are not visible to or configurable by the app, and instead are completely managed by the execution environment. Open-source log routers (such as _Logplex_ and _Fluent_) are available for this purpose.

The event stream for an app can be routed to a file, or watched via realtime tail in a terminal. Most significantly, the stream can be sent to a log indexing and analysis system such as Splunk, or a general-purpose data warehousing system such as Hadoop/Hive. These systems allow for great power and flexibility for introspecting an app’s behavior over time, including:

* Finding specific events in the past.
* Large-scale graphing of trends (such as requests per minute).
* Active alerting according to user-defined heuristics (such as an alert when the quantity of errors per minute exceeds a certain threshold).

So lets add some logging to our application. To do that include the next dependencies to the **pom.xml**
```
        <dependency>
            <groupId>org.slf4j</groupId>
            <artifactId>jcl-over-slf4j</artifactId>
            <version>1.7.13</version>
        </dependency>
        <dependency>
            <groupId>ch.qos.logback</groupId>
            <artifactId>logback-classic</artifactId>
            <version>1.1.3</version>
        </dependency>
```
In the **resources** folder create Logback configuration file **logback.xml** file with the next content
```
<?xml version="1.0" encoding="UTF-8"?>
<configuration>

    <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
        <layout class="ch.qos.logback.classic.PatternLayout">
            <Pattern>
                %d{yyyy-MM-dd HH:mm:ss} %-5level %logger{36} - %msg%n
            </Pattern>
        </layout>
    </appender>

    <logger name="YOUR.PACKAGE" level="info" additivity="false">
        <appender-ref ref="STDOUT"/>
    </logger>

    <root level="error">
        <appender-ref ref="STDOUT"/>
    </root>
</configuration>
```
Make sure that you provided correct package name instead of **"YOUR.PACKAGE"** placeholder **<logger name="YOUR.PACKAGE" level="info" additivity="false">**
And add logging to the "get by id" endpoint
```
    private static final Logger LOGGER = LoggerFactory.getLogger(StockResource.class);

    @RequestMapping(method = RequestMethod.GET, value = "/{id}")
    public StockItem stockItem(@PathVariable("id") Long id, HttpServletResponse response) {
        LOGGER.info("!!!!!! Starting search of stock item(id={}) search", id);

        StockItem stockItem = stockItemRepository.findOne(id);

        if (stockItem == null) {
            LOGGER.info("!!!!!! Stock item(id={}) has not been found", id);
            response.setStatus(HttpStatus.NOT_FOUND.value());
            return null;
        }

        LOGGER.info("!!!!!! Finishing search of stock item(id={}) search", id);
        return stockItem;
    }
```

```sh
$ mvn clean install
$ cf target -s development
$ cf push
$ cf logs workshop-12f-stock
```

Try to access endpoint (http://workshop-12f-stock.cfapps.io/stock/{id}) with appropriate item id and check the log output. It should contain something like the next
```
!!!!!! Starting search of stock item(id=1) search
!!!!!! Finishing search of stock item(id=1) search
```

If you have ELK(Elasticsearch, Logstash, Kibana) stack already installed, you can directly connect your app in CF with ELK.
Create user defined service for log draining
```
cf cups logstash-drain -l syslog://URL:5000
```
**"-l"** directive indicates that CF should send logs to the endpoint.

Next, bind and restart your application
```
cf bind-service workshop-12f-stock logstash-drain
cf restart workshop-12f-stock
```
Now check your Kibana and make sure that it receives logs from CF.
