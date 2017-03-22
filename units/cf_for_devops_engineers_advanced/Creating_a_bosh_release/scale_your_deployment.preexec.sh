cat > ~/deployment/greeter-opfile.yml <<EOF
- type: replace
  path: /networks/name=private/subnets/gateway=10.0.0.1/static/-
  value: 10.0.0.9
- type: replace
  path: /jobs/name=app/networks/name=private/static_ips/-
  value: 10.0.0.9
- type: replace
  path: /jobs/name=app/instances
  value: 2
- type: replace
  path: /jobs/name=router/properties/upstreams/-
  value: 10.0.0.9:8080
EOF
