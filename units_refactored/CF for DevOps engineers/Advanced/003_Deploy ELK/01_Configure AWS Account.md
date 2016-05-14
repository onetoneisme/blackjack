### Configure AWS Account

1. Create an Elastic IP 
```
source ~/deployment/vars
elk_eip_id=$(aws ec2 allocate-address --domain vpc --query 'AllocationId' --output text)
elk_eip=$(aws ec2 describe-addresses --allocation-ids $elk_eip_id --query 'Addresses[].PublicIp' --output text)
```

2. Store all variables in a file for later use
```
cat >> ~/deployment/vars <<EOF
export elk_eip_id=$elk_eip_id
export elk_eip=$elk_eip
EOF
```
