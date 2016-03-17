## Configure your AWS account

1. Add a rule to allow elasticsearch traffic
```
source ~/deployment/vars
aws ec2 authorize-security-group-ingress --group-id $sg_id --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 9200, "ToPort": 9200, "IpRanges": [{"CidrIp": "0.0.0.0/0"}]}]'
```

2. Add an auto-assigned IP address to our CF subnet
```
aws ec2 modify-subnet-attribute --subnet-id {{source ~/deployment/vars && echo $subnet_id}}  --map-public-ip-on-launch
```
