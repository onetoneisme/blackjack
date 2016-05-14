### Configure AWS Account

1. Create an Elastic IP 
```
source ~/deployment/vars
elk_eip_id=$(aws ec2 allocate-address --domain vpc --query 'AllocationId' --output text)
elk_eip=$(aws ec2 describe-addresses --allocation-ids $elk_eip_id --query 'Addresses[].PublicIp' --output text)
```

2. Create a new Subnet for the ELK deployment
```
elk_subnet_id=$(aws ec2 create-subnet --vpc-id $vpc_id --cidr-block 10.0.1.0/24 --availability-zone $avz --query 'Subnet.SubnetId' --output text)
aws ec2 create-tags --resources $cf_subnet_id --tags Key=Name,Value=training_elk_subnet
```

3. Associate subnet with the route table
```
aws ec2 associate-route-table --route-table-id $route_table_id --subnet-id $elk_subnet_id
```

2. Store all variables in a file for later use
```
cat >> ~/deployment/vars <<EOF
export elk_eip_id=$elk_eip_id
export elk_eip=$elk_eip
export elk_subnet_id=$elk_subnet_id
EOF
```
