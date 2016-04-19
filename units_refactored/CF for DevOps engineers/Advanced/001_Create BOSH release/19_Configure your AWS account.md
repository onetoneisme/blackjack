## Configure your AWS account

1. Add rule to allow rouret-app trafic
```
source ~/deployment/vars
aws ec2 authorize-security-group-ingress --group-id $sg_id --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 8080, "ToPort": 8080, "IpRanges": [{"CidrIp": "0.0.0.0/0"}]}]'
```

1. Add qutoassign ip property to bosh subnet
```
aws ec2 modify-subnet-attribute --subnet-id {{source ~/deployment/vars && echo $subnet_id}}  --map-public-ip-on-launch
```
