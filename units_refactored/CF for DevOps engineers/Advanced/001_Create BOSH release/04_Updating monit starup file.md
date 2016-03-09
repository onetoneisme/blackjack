## Updating monit startup file

Edit the following file `jobs/elasticsearch/monit` and add the following content to it

```
check process elasticsearch
  with pidfile /var/vcap/sys/run/elasticsearch/elasticsearch.pid
  start program "/var/vcap/jobs/elasticsearch/bin/elasticsearch_ctl start"
  stop program "/var/vcap/jobs/elasticsearch/bin/elasticsearch_ctl stop"
  group vcap
```
