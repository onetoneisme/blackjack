## Configure your AWS account

```
aws ec2 modify-subnet-attribute --subnet-id {{source ~/deployment/vars && echo $subnet_id}}  --map-public-ip-on-launch 
```
