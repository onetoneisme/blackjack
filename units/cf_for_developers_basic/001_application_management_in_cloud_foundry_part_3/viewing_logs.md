### Viewing logs

Logs are very easy to view:

```exec
cf logs my-app
```

While you are tailing the logs with the previous command, go to your browser and navigate to [your app](http://my-app.{{echo $CF_DOMAIN}}). Then, reload the page a couple of times.

> **Note**: Do not worry about the `ERR` messages. We will be fixing them  later as part of this course.

You can also dump the logs to a file instead of tailing, using the `--recent` flag.

```exec
cf logs my-app --recent > my-logs.txt
```
