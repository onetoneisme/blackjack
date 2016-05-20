### Configure your AWS account

1. Add a rule to allow router-app traffic:
```
source ~/deployment/vars
aws ec2 authorize-security-group-ingress --group-id $sg_id --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 8080, "ToPort": 8080, "IpRanges": [{"CidrIp": "0.0.0.0/0"}]}]'
```

2. Create an Elastic IP for the router job:
```
eip_router=$(aws ec2 allocate-address --domain vpc --query 'PublicIp' --output text)
echo "export eip_router=$eip_router" >> ~/deployment/vars
```
