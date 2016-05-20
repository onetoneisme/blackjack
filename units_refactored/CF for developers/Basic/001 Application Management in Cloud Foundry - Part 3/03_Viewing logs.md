### Viewing logs

Logs are very easy to view:

```sh
cf logs my-app
```

While you are tailing the logs with the previous command, go to your browser and navigate to [your app](http://my-app.{{echo $CF_DOMAIN}}). THen, reload the page a couple of times.

The output should be similar to:

```
$ cf logs my-app
Connected, tailing logs for app my-app in org my-org / space my-first-space as my-user...

2015-12-23T15:06:29.12-0300 [App/0]      ERR 181.29.164.209, 10.244.0.21 - - [23/Dec/2015 18:06:29] "GET / HTTP/1.1" 200 906 0.0246
2015-12-23T15:06:29.13-0300 [RTR/0]      OUT my-app.{{cf-get-instance-ip}}.xip.io - [23/12/2015:18:06:29 +0000] "GET / HTTP/1.1" 200 0 906 "-" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36" 10.244.0.21:50393 x_forwarded_for:"181.29.164.209, 10.244.0.21" x_forwarded_proto:"http" vcap_request_id:83ed06f6-a183-43bf-4459-356c34108c83 response_time:0.101611411 app_id:6d6911ed-ec44-40ca-92fa-14d14798686b
2015-12-23T15:06:29.36-0300 [App/1]      ERR 181.29.164.209, 10.244.0.21 - - [23/Dec/2015 18:06:29] "GET /style.css HTTP/1.1" 200 857 0.0043
2015-12-23T15:06:29.37-0300 [RTR/0]      OUT my-app.{{cf-get-instance-ip}}.xip.io - [23/12/2015:18:06:29 +0000] "GET /style.css HTTP/1.1" 200 0 857 "http://my-app.{{echo $CF_DOMAIN}}" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36" 10.244.0.21:50393 x_forwarded_for:"181.29.164.209, 10.244.0.21" x_forwarded_proto:"http" vcap_request_id:fb6c3f03-6473-4894-74e4-345bd5842ea5 response_time:0.016813959 app_id:6d6911ed-ec44-40ca-92fa-14d14798686b
2015-12-23T15:06:33.07-0300 [App/0]      ERR 181.29.164.209, 10.244.0.21 - - [23/Dec/2015 18:06:33] "GET /favicon.ico HTTP/1.1" 404 18 0.0004
2015-12-23T15:06:33.07-0300 [RTR/0]      OUT my-app.{{cf-get-instance-ip}}.xip.io - [23/12/2015:18:06:33 +0000] "GET /favicon.ico HTTP/1.1" 404 0 18 "http://my-app.{{echo $CF_DOMAIN}}" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36" 10.244.0.21:50393 x_forwarded_for:"181.29.164.209, 10.244.0.21" x_forwarded_proto:"http" vcap_request_id:806c5b61-3f99-4577-50a9-5bde5f499395 response_time:0.004557008 app_id:6d6911ed-ec44-40ca-92fa-14d14798686b
```
> **Note**: Do not worry about the ERR messages. We will be fixing them  later as part of this course.

You can also dump the logs to a file instead of tailing, using the `--recent` flag.

```sh
cf logs my-app --recent > my-logs.txt
```
