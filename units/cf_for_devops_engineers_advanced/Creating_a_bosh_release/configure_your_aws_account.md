### Configure your AWS account

1. Add a rule to allow router-app traffic:
```exec
source ~/deployment/vars
greeter_sg_id=$(aws ec2 create-security-group --vpc-id $vpc_id --group-name greeter --description "Greeter Security Group" --query 'GroupId' --output text)
aws ec2 create-tags --resources $greeter_sg_id --tags Key=Name,Value=greeter
aws ec2 authorize-security-group-ingress --group-id $greeter_sg_id --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 8080, "ToPort": 8080, "IpRanges": [{"CidrIp": "0.0.0.0/0"}]}]'
echo "export greeter_sg_id=$greeter_sg_id" >> ~/deployment/vars
```

2. Create an Elastic IP for the router job:
```exec
eip_greeter_id=$(aws ec2 allocate-address --domain vpc --query 'AllocationId' --output text)
eip_greeter=$(aws ec2 describe-addresses --allocation-ids $eip_greeter_id --query 'Addresses[].PublicIp' --output text)
echo "export eip_greeter=$eip_greeter" >> ~/deployment/vars
echo "export eip_greeter_id=$eip_greeter_id" >> ~/deployment/vars
```
