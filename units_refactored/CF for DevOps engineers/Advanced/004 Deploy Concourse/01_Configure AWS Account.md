### Configure AWS Account

1. Create an Elastic IP 
```
source ~/deployment/vars
concourse_eip_id=$(aws ec2 allocate-address --domain vpc --query 'AllocationId' --output text)
concourse_eip=$(aws ec2 describe-addresses --allocation-ids $concourse_eip_id --query 'Addresses[].PublicIp' --output text)
```

2. Create a new Subnet for the Concourse deployment
```
concourse_subnet_id=$(aws ec2 create-subnet --vpc-id $vpc_id --cidr-block 10.0.2.0/24 --availability-zone $avz --query 'Subnet.SubnetId' --output text)
aws ec2 create-tags --resources $concourse_subnet_id --tags Key=Name,Value=training_concourse_subnet
aws ec2 modify-subnet-attribute --subnet-id $concourse_subnet_id  --map-public-ip-on-launch
```

3. Associate subnet with the route table
```
aws ec2 associate-route-table --route-table-id $route_table_id --subnet-id $concourse_subnet_id
```

4. Create a Security Group
```
concourse_sg_id=$(aws ec2 create-security-group --vpc-id $vpc_id --group-name concourse_sg --description "Security Group bog concourse deployment" --query 'GroupId' --output text)
aws ec2 create-tags --resources $concourse_sg_id --tags Key=Name,Value=training_sg
```

5. Add Security Group rules

    Allow ICMP traffic
```
aws ec2 authorize-security-group-ingress --group-id $concourse_sg_id --ip-permissions '[{"IpProtocol": "icmp", "FromPort": -1, "ToPort": -1, "IpRanges": [{"CidrIp": "0.0.0.0/0"}]}]'
```

    Allow HTTP 
```
aws ec2 authorize-security-group-ingress --group-id $concourse_sg_id --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 80, "ToPort": 80, "IpRanges": [{"CidrIp": "0.0.0.0/0"}]}]'
```

    Open TSA port 
```
aws ec2 authorize-security-group-ingress --group-id $concourse_sg_id --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 2222, "ToPort": 2222, "IpRanges": [{"CidrIp": "0.0.0.0/0"}]}]'
```

    Allow all TCP and UDP traffic inside the security group
```
aws ec2 authorize-security-group-ingress --group-id $concourse_sg_id --protocol '-1' --port -1 --source-group $concourse_sg_id
```

6. Store all variables in a file for later use
```
cat >> ~/deployment/vars <<EOF
export concourse_eip_id=$concourse_eip_id
export concourse_eip=$concourse_eip
export concourse_subnet_id=$concourse_subnet_id
export concourse_sg_id=$concourse_sg_id
EOF
```
