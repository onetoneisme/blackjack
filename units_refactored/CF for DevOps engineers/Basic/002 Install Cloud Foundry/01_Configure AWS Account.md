## Configure your AWS account

To configure your AWS account for CF you must do the following:

1. Add a rule to allow loggregator traffic
```
source ~/deployment/vars
aws ec2 authorize-security-group-ingress --group-id $sg_id --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 4443, "ToPort": 4443, "IpRanges": [{"CidrIp": "0.0.0.0/0"}]}]'
```

2. Create a new Subnet for the Cloud Foundry deployment
```
cf_subnet_id=$(aws ec2 create-subnet --vpc-id $vpc_id --cidr-block 10.0.16.0/24 --availability-zone $avz  --query 'Subnet.SubnetId'  --output text)
aws ec2 create-tags --resources $cf_subnet_id --tags Key=Name,Value=training_cf_subnet
```

3. Create an Elastic IP for NAT
```
nat_eip_id=$(aws ec2 allocate-address --domain vpc --query 'AllocationId' --output text)
nat_eip=$(aws ec2 describe-addresses --allocation-ids $nat_eip_id --query 'Addresses[].PublicIp' --output text)
```

4. Create a NAT Gateway
```
nat_gateway_id=$(aws ec2 create-nat-gateway --subnet-id $subnet_id --allocation-id $nat_eip_id --query 'NatGateway.NatGatewayId' --output text)
```

5. Create a Route Table
```
cf_route_table_id=$(aws ec2 create-route-table --vpc-id $vpc_id --query 'RouteTable.RouteTableId' --output text)
aws ec2 associate-route-table --route-table-id $cf_route_table_id --subnet-id $cf_subnet_id
```

6. Create a Route
```
aws ec2 create-route --nat-gateway-id $nat_gateway_id --route-table-id $cf_route_table_id  --destination-cidr-block 0.0.0.0/0
```

7. Create a Security Group
```
cf_sg_id=$(aws ec2 create-security-group --vpc-id $vpc_id --group-name cf_training_sg --description "Security Group bog CF deployment" --query 'GroupId' --output text)
aws ec2 create-tags --resources $cf_sg_id --tags Key=Name,Value=cf_training_sg
```

8. Add Security Group rules
Allow HTTP traffic
```
aws ec2 authorize-security-group-ingress --group-id $cf_sg_id --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 80, "ToPort": 80, "IpRanges": [{"CidrIp": "0.0.0.0/0"}]}]'
```
Allow HTTPS traffic
```
aws ec2 authorize-security-group-ingress --group-id $cf_sg_id --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 443, "ToPort": 443, "IpRanges": [{"CidrIp": "0.0.0.0/0"}]}]'
```
Allow loggregator traffic
```
aws ec2 authorize-security-group-ingress --group-id $cf_sg_id --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 4443, "ToPort": 4443, "IpRanges": [{"CidrIp": "0.0.0.0/0"}]}]'
```

9. Create an Elastic IP
```
cf_eip_id=$(aws ec2 allocate-address --domain vpc --query 'AllocationId' --output text)
cf_eip=$(aws ec2 describe-addresses --allocation-ids $cf_eip_id --query 'Addresses[].PublicIp' --output text)
```

10. Store all variables in a file for later use
```
cat >> ~/deployment/vars <<EOF
export cf_subnet_id=$cf_subnet_id
export cf_eip_id=$cf_eip_id
export cf_eip=$cf_eip
export nat_eip_id=$nat_eip_id
export nat_eip=$nat_eip
export nat_gateway_id=$nat_gateway_id
export cf_route_table_id=$cf_route_table_id
export cf_sg_id=$cf_sg_id
EOF
```
