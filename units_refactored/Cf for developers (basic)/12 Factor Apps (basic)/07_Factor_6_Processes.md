### VI. Processes
#### Execute the app as one or more stateless processes
The app is executed in the execution environment as one or more processes.

In the simplest case, the code is a stand-alone script, the execution environment is a developer’s local laptop with an installed language runtime, and the process is launched via the command line (for example, ```python my_script.py```). On the other end of the spectrum, a production deploy of a sophisticated app may use many process types, instantiated into zero or more running processes.

**Twelve-factor processes are stateless and share-nothing.** Any data that needs to persist must be stored in a stateful backing service, typically a database.

The memory space or filesystem of the process can be used as a brief, single-transaction cache. For example, downloading a large file, operating on it, and storing the results of the operation in the database. The twelve-factor app never assumes that anything cached in memory or on disk will be available on a future request or job – with many processes of each type running, chances are high that a future request will be served by a different process. Even when running only one process, a restart (triggered by code deploy, config change, or the execution environment relocating the process to a different physical location) will usually wipe out all local (e.g., memory and filesystem) state.

Asset packagers (such as Jammit or django-compressor) use the filesystem as a cache for compiled assets. A twelve-factor app prefers to do this compiling during the build stage, such as the Rails asset pipeline, rather than at runtime.

Some web systems rely on “sticky sessions” – that is, caching user session data in memory of the app’s process and expecting future requests from the same visitor to be routed to the same process. Sticky sessions are a violation of twelve-factor and should never be used or relied upon. Session state data is a good candidate for a datastore that offers time-expiration, such as Memcached or Redis.

#### Part 1
Lets create statefull process. Probably the most common case is in-memory user session. So we enable Spring Security and set up in-memory session. First we need to include Spring Security dependencies in our project. Insert the next text in your **pom.xml**
```
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-security</artifactId>
            <version>1.3.1.RELEASE</version>
        </dependency>
```
To set Spring Security up we need to create seccurity context. In your main package create **"SecurityConfig"** class

```
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication()
                .withUser("admin").password("admin_pass").roles("ADMIN")
                .and()
                .withUser("user").password("user_pass").roles("USER");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests()
                .antMatchers("/secured/admin").hasRole("ADMIN")
                .antMatchers("/secured/user").authenticated()
                .and()
                .httpBasic()
                .and()
                .requestCache()
                .requestCache(new NullRequestCache());
    }
}
```
In that class we define two users (**admin** and **user**) with **ADMIN** and **USER** roles correspondingly. And set the authorization rules for these roles.
Spring Boot automatically include this class to its configuration on startup.

Now create two resources to test **Spring Session**: **SecuredResource** and **LogoutResource**

```
@RestController
@RequestMapping(value = "/secured")
public class SecuredResource {

    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String userHello(Principal principal) {

        return "Hello " + principal.getName() + "!";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String adminHello(Principal principal) {

        return "Hello " + principal.getName() + "!";
    }

}
```
```
@RestController
public class LogoutResource {

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {

        session.invalidate();
        return "Logout done!";
    }

}
```
**SecuredResource** provides two enpoints:**'/admin'** can be accced only by **ADMIN**, **'/user'** - by **ADMIN** and **USER**.

Build and push your project
```
$ mvn clean build
$ cf push
```
Try to access secured enpoints (http://workshop-12f-stock.cfapps.io/secured/admin, http://workshop-12f-stock.cfapps.io/secured/user), make sure that with 'user' you are not allowed to access **'/admin'**.
After login restart the application.
```
$ cf restart workshop-12f-stock
```
and check that you have to login again (make sure that you close and open your browser, some of them can cache basic authentication credentials).

#### Part 2
Now lets implement user session using stateless process. We will use Redis to hold session.

Add corresponding dependency to **pom.xml**
```
        <dependency>
            <groupId>org.springframework.session</groupId>
            <artifactId>spring-session-data-redis</artifactId>
            <version>1.0.2.RELEASE</version>
        </dependency>
```
Mark StockSpringBootStarter with annotation **@EnableRedisHttpSession** to let Spring Boot know that we use Redis to keep sessions.
```
@SpringBootApplication
@EnableRedisHttpSession
public class StockSpringBootStarter {
```
Create **Redis servic**e on CF
```
$ cf create-service rediscloud 30mb redis
```

Update **manifest.yml** to bind redis service (replace **{project-name}** with correct value)
```
---
applications:
  - name: workshop-12f-stock
    path: target/{project-name}-SNAPSHOT.jar
    buildpack: https://github.com/cloudfoundry/java-buildpack.git
    memory: 512M
    services:
      - mysql
      - redis
```
Build and push your project
```
$ mvn clean install
$ cf push
```
Try to access secured enpoints (http://workshop-12f-stock.cfapps.io/secured/admin, http://workshop-12f-stock.cfapps.io/secured/user), make sure that with 'user' you are not allowed to access **'/admin'**.
After login restart the application.
```
$ cf restart workshop-12f-stock
```
and check that session is kept.
