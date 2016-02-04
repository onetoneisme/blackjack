### III. Config
#### Store config in the environment

An app’s config is everything that is likely to vary between deploys (staging, production, developer environments, etc). This includes:

Resource handles to the database, Memcached, and other backing services
Credentials to external services such as Amazon S3 or Twitter
Per-deploy values such as the canonical hostname for the deploy
Apps sometimes store config as constants in the code. This is a violation of twelve-factor, which requires **strict separation of config from code**. Config varies substantially across deploys, code does not.

A litmus test for whether an app has all config correctly factored out of the code is whether the codebase could be made open source at any moment, without compromising any credentials.

The twelve-factor app stores config in environment variables (often shortened to env vars or env). Env vars are easy to change between deploys without changing any code; unlike config files, there is little chance of them being checked into the code repo accidentally; and unlike custom config files, or other config mechanisms such as Java System Properties, they are a language- and OS-agnostic standard.

To access CF environment variables via Spring you need to use org.springframework.core.env.Environment class.
Change **StockResource** class with the next code:
```
    @Autowired
    private Environment environment;

    @RequestMapping(value = "/ping", method = RequestMethod.GET)
    public String ping() {
        return "Ping" + " " + environment.getProperty("environment.variable");
    }
```
Execute
```
$ mvn clean install
$ cf push workshop-12f-stock -p target/project-name-1.0-SNAPSHOT.jar
```
Now if you access **http://workshop-12f-stock.cfapps.io/stock/ping** you see "Ping null" as the output. It is because we haven't set environmrnt variable value yet. Let do it.
```
$ cf set-env workshop-12f-stock environment.variable some_value
```
Now you should restart your app
```
cf restart workshop-12f-stock
```

Access **http://workshop-12f-stock.cfapps.io/stock/ping** and make sure that output is "Ping some_value".