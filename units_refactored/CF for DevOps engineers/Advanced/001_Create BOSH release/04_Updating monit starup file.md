## Add the monit config

Create the file `jobs/elasticsearch/monit` and add the following content:

```
check process elasticsearch
  with pidfile /var/vcap/sys/run/elasticsearch/elasticsearch.pid
  start program "/var/vcap/jobs/elasticsearch/bin/elasticsearch_ctl start"
  stop program "/var/vcap/jobs/elasticsearch/bin/elasticsearch_ctl stop"
  group vcap
```
