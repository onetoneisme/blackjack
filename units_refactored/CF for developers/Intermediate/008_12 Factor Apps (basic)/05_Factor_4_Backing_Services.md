### IV. Backing services
#### Treat backing services as attached resources

A backing service is any service the app consumes over a network as part of its normal operation. Examples include data stores (such as MySQL or CouchDB), messaging/queueing systems (such as RabbitMQ or Beanstalkd), SMTP services for outbound email (such as Postfix), and caching systems (such as Memcached).

Backing services, like a database, are traditionally managed by the same system administrators as the app’s runtime deploy. In addition to these locally-managed services, the app may also have services provided and managed by third parties. Examples include SMTP services (such as Postmark), metrics-gathering services (such as New Relic or Loggly), binary asset services (such as Amazon S3), and even API-accessible consumer services (such as Twitter, Google Maps, or Last.fm).

The code for a twelve-factor app makes no distinction between local and third-party services. To the app, both are attached resources, accessed via a URL or other locator/credentials stored in the config. A deploy of the twelve-factor app should be able to swap out a local MySQL database with one managed by a third party (such as Amazon RDS) without any changes to the app’s code. Likewise, a local SMTP server could be swapped with a third-party SMTP service (such as Postmark) without code changes. In both cases, only the resource handle in the config needs to change.

Let's implement some data storage via **JPA**. We are going to use MySQL for it.
Add the following dependencies to your `pom.xml`.
```
        <dependency>
            <groupId>mysql</groupId>
            <artifactId>mysql-connector-java</artifactId>
            <version>5.1.37</version>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jpa</artifactId>
            <version>1.3.1.RELEASE</version>
        </dependency>
        <dependency>
            <groupId>org.flywaydb</groupId>
            <artifactId>flyway-core</artifactId>
            <version>3.2.1</version>
        </dependency>
```
Here, we include a MySQL connector and let Spring Boot know that we are using JPA to store/retrieve data and that DB versioning is supported by Flyway.
In `src/main/`, create a directory called `resources/db/migration`. Then, put a file called `V1.0.0__create_stock_table.sql` into the directory. Here, are the contents of this file:
```
CREATE TABLE `stock_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
```
All we do here, is create a simple table in our MySQL.

Now, let's create a JPA entity and a repository. In your main package, create a subpackage and name it `domain.model`. Then put the `ItemType` enum and `StockItem` entity in there:
```
public enum ItemType {

    UNKNOWN(1L),
    ELECTRONICS(2L),
    CD(3L);

    Long id;

    ItemType(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }
}
```
```
@Entity
@Table(name = "stock_item")
public class StockItem {

    @Id
    @GeneratedValue
    @Column(name = "id", nullable = false, unique = true)
    private Long id;

    @Enumerated(EnumType.STRING)
    private ItemType type;

    @Column(name = "title", nullable = false, length = 45)
    private String title;

    @Column(name = "description", length = 1000)
    private String description;

    public StockItem() {
    }

    public StockItem(Long id, ItemType type, String title, String description) {
        this.id = id;
        this.type = type;
        this.title = title;
        this.description = description;
    }

    public Long getId() {
        return id;
    }

    public ItemType getType() {
        return type;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }
}
```

After that, create a corresponding repository, `StockItemRepository`:
```
public interface StockItemRepository extends CrudRepository<StockItem, Long> {
    List<StockItem> findByType(ItemType type);
}
```
Now, you can update your `StockResource` to provide standard CRUD operations:
```
    @Autowired
    private Environment environment;
    @Autowired
    private StockItemRepository stockItemRepository;

    @RequestMapping(value = "/ping", method = RequestMethod.GET)
    public String ping() {
        return "Ping" + " " + environment.getProperty("environment.variable");
    }

    @RequestMapping(method = RequestMethod.GET, value = "/{id}")
    public StockItem stockItem(@PathVariable("id") Long id, HttpServletResponse response) {

        StockItem stockItem = stockItemRepository.findOne(id);

        if (stockItem == null) {
            response.setStatus(HttpStatus.NOT_FOUND.value());
            return null;
        }

        return stockItem;
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public StockItem storeInStock(@RequestBody StockItem stockItem, HttpServletResponse response) {
        StockItem storedItem = stockItemRepository.save(stockItem);

        response.setStatus(HttpStatus.CREATED.value());

        return storedItem;
    }

    @RequestMapping(value = "", method = RequestMethod.PUT)
    public StockItem update(@RequestBody StockItem stockItem, HttpServletResponse response) {
        if (!stockItemRepository.exists(stockItem.getId())) {
            response.setStatus(HttpStatus.NOT_FOUND.value());
            return stockItem;
        }

        return stockItemRepository.save(stockItem);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void removeFromStock(@PathVariable("id") Long id, HttpServletResponse response) {
        StockItem stockItemToRemove = stockItemRepository.findOne(id);

        if (stockItemToRemove == null) {
            response.setStatus(HttpStatus.NOT_FOUND.value());
            return;
        }

        stockItemRepository.delete(stockItemToRemove);
    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public Iterable<StockItem> items() {
        return stockItemRepository.findAll();
    }
```
The last step is to create a CF configuration file, `manifest.yml`, to provide basic information about our application. Place it into the root of your project.
```
---
applications:
  - name: workshop-12f-stock
    path: target/{project-name}-1.0-SNAPSHOT.jar
    buildpack: https://github.com/cloudfoundry/java-buildpack.git
    memory: 512M
    services:
      - mysql
```

So, from now, our application is able to use JPA. But we still need to create a MySQL service in our CF:
```
cf create-service cleardb spark mysql
```
and connect it to our application:
```
cf bind-service workshop-12f-stock mysql
```
Now, let's build the application:
```
mvn clean install
```
and push it to CF:
```
cf push
```
Since we provide the `manifest.yml` file, we can execute the `cf push` command without any information about the JAR file's location.

Try to access your application at `http://workshop-12f-stock.{{echo $CF_DOMAIN}}/stock/ping`. Now, `POST` the new `StockItem` via some REST client:
```
POST http://workshop-12f-stock.{{echo $CF_DOMAIN}}/stock
Content-Type: application/json
{"type":"CD","title":"Adele","description":"Hello"}
```
then try to `GET` it:
```
GET http://workshop-12f-stock.{{echo $CF_DOMAIN}}/stock
```
