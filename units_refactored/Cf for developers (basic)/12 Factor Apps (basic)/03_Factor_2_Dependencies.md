### II. Dependencies
##### Explicitly declare and isolate dependencies
Most programming languages offer a packaging system for distributing support libraries, such as CPAN for Perl or Rubygems for Ruby. Libraries installed through a packaging system can be installed system-wide (known as “site packages”) or scoped into the directory containing the app (known as “vendoring” or “bundling”).

A twelve-factor app never relies on implicit existence of system-wide packages. It declares all dependencies, completely and exactly, via a dependency declaration manifest. Furthermore, it uses a dependency isolation tool during execution to ensure that no implicit dependencies “leak in” from the surrounding system. The full and explicit dependency specification is applied uniformly to both production and development.
In Java we use Maven and Gradle.

Generate your workshop project via **Maven** command **archetype:generate** (use appropriate names in braces) 
```sh 
$ mvn archetype:generate -DgroupId={project-packaging} -DartifactId={project-name} -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
```

Maven should create folder with the next structure:
```
├── {project-name}/
│   ├── pom.xml
│   ├── src
│   │   ├── main
│   │   │   ├── java
│   │   │   │   ├──{project-packaging}
│   │   │   │   │   ├──App.java
│   │   ├── test
│   │   │   ├──java
│   │   │   │   ├──{project-packaging}
│   │   │   │   │   ├──AppTest.java
```
Delete unnecessary files App.java and AppTest.java.

To test dependency management we are going to create Spring Boot application with simple REST endpoint.

At first we need to add Spring Boot to our application. In the **pom.xml** add corresponding dependencies:
```
<dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
            <version>1.3.0.RELEASE</version>
        </dependency>

        <!-- Test Dependencies-->
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.12</version>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-test</artifactId>
            <version>4.2.3.RELEASE</version>
            <scope>test</scope>
        </dependency>
    </dependencies>

    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
                <executions>
                    <execution>
                        <goals>
                            <goal>repackage</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>
        </plugins>
    </build>
```
In the root package (project-packaging) create two classes StockSpringBootStarter and StockResource.
```
@SpringBootApplication
public class StockSpringBootStarter {
    public static void main(String[] args) {
        SpringApplication.run(StockSpringBootStarter.class, args);
    }
}
```
```
@RestController
@RequestMapping(value = "/stock", produces = MediaType.APPLICATION_JSON_VALUE)
public class StockResource {
    @RequestMapping(value = "/ping", method = RequestMethod.GET)
    public String ping() {
        return "Ping";
    }
}
```

Build application by running form the root of your project
```sh
$ mvn clean install
```
If all is OK you should see something like the next
```
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 11.241 s
[INFO] Finished at: 2016-02-02T15:08:09+03:00
[INFO] Final Memory: 24M/209M
[INFO] ------------------------------------------------------------------------
```
Then launch Spring Boot application
```
$ java -jar target/project-name-1.0-SNAPSHOT.jar
```

In your browser try to access **http://localhost:8080/stock/ping**. You should see **"Ping"** as response.
As you have working application you can push it to CF. From the root of your project execute
```
$ cf push workshop-12f-stock -p target/project-name-1.0-SNAPSHOT.jar
```
If all is OK you should see similar output:
```
requested state: started
instances: 1/1
usage: 1G x 1 instances
urls: workshop-12f-stock.cfapps.io
last uploaded: Tue Feb 2 13:11:05 UTC 2016
stack: cflinuxfs2
buildpack: java-buildpack=v3.5.1-http://github.com/pivotal-cf/pcf-java-buildpack.git#d6c19f8 java-main open-jdk-like-jre=1.8.0_71 open-jdk-like-memory-calculator=2.0.1_RELEASE spring-auto-reconfiguration=1.10.0_RELEASE

     state     since                    cpu    memory    disk      details
#0   running   2016-02-02 04:11:45 PM   0.0%   0 of 1G   0 of 1G

D:\temp\asd;lfka's;dflk\project-name>
```
Try to access your app from CF **http://workshop-12f-stock.cfapps.io/stock/ping**
