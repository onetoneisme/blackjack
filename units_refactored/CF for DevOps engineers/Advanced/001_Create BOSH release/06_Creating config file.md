## Create a config template

Edit the file `jobs/elasticsearch/templates/elasticsearch.yml.erb` and add the following content:

```
---
path:
  logs: /var/vcap/sys/log/elasticsearch
  data: /var/vcap/store/elasticsearch
  work: /var/vcap/data/elasticsearch

node.name: es-node-<%= spec.index %>

cluster.name: <%= p('elasticsearch.cluster') %>

discovery.zen.ping:
  multicast.enabled: false
  unicast.hosts:
  <% p('elasticsearch.ping_hosts').each do |host| %>
  - <%= host %>
  <% end %>
```
