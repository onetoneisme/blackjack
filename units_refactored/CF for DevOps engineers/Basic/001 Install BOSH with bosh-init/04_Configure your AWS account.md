## Configure your AWS account

To configure your AWS account for BOSH, you must do the following:

1. Create a Virtual Private Cloud (VPC)
```
vpc_id=$(aws ec2 create-vpc --cidr-block '10.0.0.0/16'  --query 'Vpc.VpcId' --output text)
aws ec2 create-tags --resources $vpc_id --tags Key=Name,Value=training_vpc
```

2. Create a Subnet
```
subnet_id=$(aws ec2 create-subnet --vpc-id $vpc_id --cidr-block 10.0.0.0/24 --query 'Subnet.SubnetId'  --output text)
aws ec2 create-tags --resources $subnet_id --tags Key=Name,Value=training_subnet
avz=$(aws ec2 describe-subnets --subnet-ids $subnet_id --query 'Subnets[].AvailabilityZone' --output text)
```

3. Create an Internet Gateway and attach it to the VPC
```
gateway_id=$(aws ec2 create-internet-gateway --query 'InternetGateway.InternetGatewayId' --output text)
aws ec2 attach-internet-gateway --internet-gateway-id $gateway_id --vpc-id $vpc_id
```

4. Create a Route Table and associate it with Subnet
```
route_table_id=$(aws ec2 create-route-table --vpc-id $vpc_id --query 'RouteTable.RouteTableId' --output text)
aws ec2 associate-route-table --route-table-id $route_table_id --subnet-id $subnet_id
```

5. Create a Route
```
aws ec2 create-route --gateway-id $gateway_id --route-table-id $route_table_id  --destination-cidr-block 0.0.0.0/0
```

5.  Create a Security Group
```
sg_id=$(aws ec2 create-security-group --vpc-id $vpc_id --group-name training_sg --description "Security Group bog BOSH deployment" --query 'GroupId' --output text)
aws ec2 create-tags --resources $sg_id --tags Key=Name,Value=training_sg
```

6. Add Rules to the Security Group
Allow ICMP traffic
```
aws ec2 authorize-security-group-ingress --group-id $sg_id --ip-permissions '[{"IpProtocol": "icmp", "FromPort": -1, "ToPort": -1, "IpRanges": [{"CidrIp": "0.0.0.0/0"}]}]'
```
Allow SSH access
```
aws ec2 authorize-security-group-ingress --group-id $sg_id --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 22, "ToPort": 22, "IpRanges": [{"CidrIp": "0.0.0.0/0"}]}]'
```
Allow bosh-init to access the bosh agent
```
aws ec2 authorize-security-group-ingress --group-id $sg_id --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 6868, "ToPort": 6868, "IpRanges": [{"CidrIp": "0.0.0.0/0"}]}]'
```
Allow the bosh cli to access the bosh director
```
aws ec2 authorize-security-group-ingress --group-id $sg_id --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 25555, "ToPort": 25555, "IpRanges": [{"CidrIp": "0.0.0.0/0"}]}]'
```
Allow all TCP and UDP trafic inside the security group
```
aws ec2 authorize-security-group-ingress --group-id $sg_id --protocol '-1' --port -1 --source-group $sg_id
```

7. Create an Elastic IP
```
eip_id=$(aws ec2 allocate-address --domain vpc --query 'AllocationId' --output text)
eip=$(aws ec2 describe-addresses --allocation-ids $eip_id --query 'Addresses[].PublicIp' --output text)
```

8. Create a Key Pair
```
mkdir deployment
aws ec2 create-key-pair --key-name training_key --query 'KeyMaterial' --output text > deployment/bosh.pem
chmod 600 deployment/bosh.pem
```

9. Store all variables in a file for later use
```
cat > ~/deployment/vars <<EOF
export vpc_id=$vpc_id
export subnet_id=$subnet_id
export gateway_id=$gateway_id
export route_table_id=$route_table_id
export sg_id=$sg_id
export eip_id=$eip_id
export eip=$eip
export avz=$avz
EOF
chmod +x deployment/vars
```
