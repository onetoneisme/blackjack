### Update the router Monit config

Open the file `jobs/router/monit` in a text editor and add the following content to it:

```
check process router
  with pidfile /var/vcap/sys/run/router/router.pid
  start program "/var/vcap/jobs/router/bin/ctl start"
  stop program "/var/vcap/jobs/router/bin/ctl stop"
  group vcap
```
