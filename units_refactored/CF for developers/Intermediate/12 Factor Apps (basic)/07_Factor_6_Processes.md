### VI. Processes
#### Execute the app as one or more stateless processes
The app is executed in the execution environment as one or more processes.

In the simplest case, the code is a stand-alone script, the execution environment is a developer’s local laptop with an installed language runtime, and the process is launched via the command line (for example, ```python my_script.py```). On the other end of the spectrum, a production deploy of a sophisticated app may use many process types, instantiated into zero or more running processes.

**Twelve-factor processes are stateless and share-nothing.** Any data that needs to persist must be stored in a stateful backing service, typically a database.

The memory space or filesystem of the process can be used as a brief, single-transaction cache. For example, downloading a large file, operating on it, and storing the results of the operation in the database. The twelve-factor app never assumes that anything cached in memory or on disk will be available on a future request or job – with many processes of each type running, chances are high that a future request will be served by a different process. Even when running only one process, a restart (triggered by code deploy, config change, or the execution environment relocating the process to a different physical location) will usually wipe out all local (e.g., memory and filesystem) state.

Asset packagers (such as Jammit or django-compressor) use the filesystem as a cache for compiled assets. A twelve-factor app prefers to do this compiling during the build stage, such as the Rails asset pipeline, rather than at runtime.

Some Web systems rely on “sticky sessions” – that is, caching user session data in memory of the app’s process and expecting future requests from the same visitor to be routed to the same process. Sticky sessions are a violation of twelve-factor and should never be used or relied upon. Session state data is a good candidate for a datastore that offers time-expiration, such as Memcached or Redis.

#### Part 1
Let's create stateful process. Probably the most common use case is an in-memory user session. So, we will enable Spring Security and set up an in-memory session.

First, we need to include the Spring Security dependencies into our project. Insert the following text into your `pom.xml`:
```
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-security</artifactId>
            <version>1.3.1.RELEASE</version>
        </dependency>
```
To set up Spring Security, we need to create a security context. In your main package, create the `"SecurityConfig"` class:

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
In that class, we define two users (`admin` and `user`) with `ADMIN` and `USER` roles respectively. We also set the authorization rules for these roles.
Spring Boot automatically includes this class into its configuration on startup.

Now, create two resources to test `Spring Session`: `SecuredResource` and `LogoutResource`:

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
`SecuredResource` provides two endpoints:`'/admin'` (which can be accessed only by `ADMIN`) and `'/user'` (accessible by both `ADMIN` and `USER`).

Build and push your project:
```
$ mvn clean build
$ cf push
```
Try accessing the secured endpoints (`http://workshop-12f-stock.cfapps.io/secured/admin` and `http://workshop-12f-stock.cfapps.io/secured/user`). Make sure that you are not allowed to access `'/admin'` with `'user'`.
After logging in, restart the application:
```
$ cf restart workshop-12f-stock
```
and check that you have to login again (make sure that you close and open your browser, some of them can cache basic authentication credentials).

#### Part 2
Now, let's implement a user session, using a stateless process. We will use Redis to hold the session.

Add the corresponding dependency to `pom.xml`:
```
        <dependency>
            <groupId>org.springframework.session</groupId>
            <artifactId>spring-session-data-redis</artifactId>
            <version>1.0.2.RELEASE</version>
        </dependency>
```
Mark `StockSpringBootStarter` with the `@EnableRedisHttpSession` annotation to let Spring Boot know that we are using Redis to keep sessions.
```
@SpringBootApplication
@EnableRedisHttpSession
public class StockSpringBootStarter {
```
Create a *Redis service* on CF:
```
$ cf create-service rediscloud 30mb redis
```

Update `manifest.yml` to bind the Redis service (replace `{project-name}` with a valid value):
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
Build and push your project:
```
$ mvn clean install
$ cf push
```
Try accessing the secured endpoints (`http://workshop-12f-stock.cfapps.io/secured/admin` and `http://workshop-12f-stock.cfapps.io/secured/user`). Make sure that you are not allowed to access `'/admin'` with `'user'`.
After logging in, restart the application:
```
$ cf restart workshop-12f-stock
```
and check that the session is being kept.
