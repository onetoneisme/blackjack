### Update the app Monit config

Open the file `jobs/app/monit` and add the following lines:

```file=~/greeter-release/jobs/app/monit
check process app
  with pidfile /var/vcap/sys/run/app/app.pid
  start program "/var/vcap/jobs/app/bin/ctl start"
  stop program "/var/vcap/jobs/app/bin/ctl stop"
  group vcap
```
