## Configure your AWS account

To configure your AWS account you have to do the following steps

1. Add rule to allow loggregator trafic
```
source ~/deployment/vars
aws ec2 authorize-security-group-ingress --group-id $sg_id --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 4443, "ToPort": 4443, "IpRanges": [{"CidrIp": "0.0.0.0/0"}]}]'
```

2. Create new Subnet for Cloud Foundry deployment
```
cf_subnet_id=$(aws ec2 create-subnet --vpc-id $vpc_id --cidr-block 10.0.16.0/24 --availability-zone $avz  --query 'Subnet.SubnetId'  --output text)
aws ec2 create-tags --resources $cf_subnet_id --tags Key=Name,Value=training_cf_subnet
```

3. Create Elastic IP for NAT
```
nat_eip_id=$(aws ec2 allocate-address --domain vpc --query 'AllocationId' --output text)
nat_eip=$(aws ec2 describe-addresses --allocation-ids $nat_eip_id --query 'Addresses[].PublicIp' --output text)
```

4. Create NAT gateway
```
nat_gateway_id=$(aws ec2 create-nat-gateway --subnet-id $subnet_id --allocation-id $nat_eip_id --query 'NatGateway.NatGatewayId' --output text)
```

5. Create Route Table
```
cf_route_table_id=$(aws ec2 create-route-table --vpc-id $vpc_id --query 'RouteTable.RouteTableId' --output text)
aws ec2 associate-route-table --route-table-id $cf_route_table_id --subnet-id $cf_subnet_id 
```

6. Create Route
```
aws ec2 create-route --nat-gateway-id $nat_gateway_id --route-table-id $cf_route_table_id  --destination-cidr-block 0.0.0.0/0
```

7. Create Security Group
```
cf_sg_id=$(aws ec2 create-security-group --vpc-id $vpc_id --group-name cf_training_sg --description "Security Group bog CF deployment" --query 'GroupId' --output text)
aws ec2 create-tags --resources $cf_sg_id --tags Key=Name,Value=cf_training_sg
```

8. Add Security Group rules
Allow HTTP trafic
```
aws ec2 authorize-security-group-ingress --group-id $cf_sg_id --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 80, "ToPort": 80, "IpRanges": [{"CidrIp": "0.0.0.0/0"}]}]'
```
Allow HTTPS trafic
```
aws ec2 authorize-security-group-ingress --group-id $cf_sg_id --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 443, "ToPort": 443, "IpRanges": [{"CidrIp": "0.0.0.0/0"}]}]'
```
Allow loggregator trafic
```
aws ec2 authorize-security-group-ingress --group-id $cf_sg_id --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 4443, "ToPort": 4443, "IpRanges": [{"CidrIp": "0.0.0.0/0"}]}]'
```

9. Create Elastic IP
```
cf_eip_id=$(aws ec2 allocate-address --domain vpc --query 'AllocationId' --output text)
cf_eip=$(aws ec2 describe-addresses --allocation-ids $cf_eip_id --query 'Addresses[].PublicIp' --output text)
```

10. Store all variables in a file for later ussage
```
cat >> deployment/vars <<EOF
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
