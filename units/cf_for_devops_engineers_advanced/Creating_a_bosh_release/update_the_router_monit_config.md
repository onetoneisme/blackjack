### Update the router Monit config

On a deployed release, a BOSH Agent runs on each job VM. BOSH communicates with the Agent, which in turn executes commands in the control script. The Agent does this using open source process monitoring software called [Monit](https://mmonit.com/monit/).

To update the router Monit config, open the file `jobs/router/monit` in a text editor and add the following content to it:

```file=~/greeter-release/jobs/router/monit
check process router
  with pidfile /var/vcap/sys/run/router/router.pid
  start program "/var/vcap/jobs/router/bin/ctl start"
  stop program "/var/vcap/jobs/router/bin/ctl stop"
  group vcap
```



