### X. Dev/prod parity
#### Keep development, staging, and production as similar as possible

Historically, there have been substantial gaps between development (a developer making live edits to a local deploy of the app) and production (a running deploy of the app accessed by end users). These gaps manifest in three areas:

* **The time gap:** A developer may work on code that takes days, weeks, or even months to go into production.
* **The personnel gap:** Developers write code, ops engineers deploy it.
* **The tools gap:** Developers may be using a stack like Nginx, SQLite, and OS X, while the production deploy uses Apache, MySQL, and Linux.
* 
**The twelve-factor app is designed for continuous deployment by keeping the gap between development and production small.** Looking at the three gaps described above:

* Make the time gap small: a developer may write code and have it deployed hours or even just minutes later.
* Make the personnel gap small: developers who wrote code are closely involved in deploying it and watching its behavior in production.
* Make the tools gap small: keep development and production as similar as possible.

For now we has been working in **development** space. Check it
```sh
$ cf target
```
You should see similar output
```
API endpoint:   https://api.run.pivotal.io (API version: 2.46.0)
User:           user_name
Org:            your-org
Space:          development
```
Lets create **production_test** space (environment).
```sh
$ cf create-space production_test
```
and switch our CF client to work with that space
```sh
$ cf target -s production_test
```
To run our application we need MySQl and Redis services.
```sh
$ cf create-service cleardb spark mysql
$ cf create-service rediscloud 30mb redis
```

Now we are able to push our application to **production_test**
```sh
$ cf push -n workshop-12f-stock-production_test
```
Try to access your production_test deployment http://workshop-12f-stock-production_test.{{echo $CF_DOMAIN}}/stock/ping and make sure that it is work properly.
