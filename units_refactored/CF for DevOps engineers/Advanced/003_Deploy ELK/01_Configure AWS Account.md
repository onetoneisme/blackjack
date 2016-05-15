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
aws ec2 create-tags --resources $elk_subnet_id --tags Key=Name,Value=training_elk_subnet
aws ec2 modify-subnet-attribute --subnet-id $elk_subnet_id  --map-public-ip-on-launch
```

3. Associate subnet with the route table
```
aws ec2 associate-route-table --route-table-id $route_table_id --subnet-id $elk_subnet_id
```

4. Create a Security Group
```
elk_sg_id=$(aws ec2 create-security-group --vpc-id $vpc_id --group-name elk_sg --description "Security Group bog elk deployment" --query 'GroupId' --output text)
aws ec2 create-tags --resources $elk_sg_id --tags Key=Name,Value=training_sg
```

5. Add Security Group rules

    Allow ICMP traffic
```
aws ec2 authorize-security-group-ingress --group-id $elk_sg_id --ip-permissions '[{"IpProtocol": "icmp", "FromPort": -1, "ToPort": -1, "IpRanges": [{"CidrIp": "0.0.0.0/0"}]}]'
```

    Allow HTTP 
```
aws ec2 authorize-security-group-ingress --group-id $elk_sg_id --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 80, "ToPort": 80, "IpRanges": [{"CidrIp": "0.0.0.0/0"}]}]'
```

    Open TSA port 
```
aws ec2 authorize-security-group-ingress --group-id $elk_sg_id --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 2222, "ToPort": 2222, "IpRanges": [{"CidrIp": "0.0.0.0/0"}]}]'
```

    Allow all TCP and UDP traffic inside the security group
```
aws ec2 authorize-security-group-ingress --group-id $elk_sg_id --protocol '-1' --port -1 --source-group $elk_sg_id
```

6. Store all variables in a file for later use
```
cat >> ~/deployment/vars <<EOF
export elk_eip_id=$elk_eip_id
export elk_eip=$elk_eip
export elk_subnet_id=$elk_subnet_id
export elk_sg_id=$elk_sg_id
EOF
```
