## Explore BOSH VM folder structure

1. SSH to any BOSH VM
```
bosh ssh  --gateway_host {{source ~/deployment/vars &&  echo $eip}} --gateway_user vcap --gateway_identity_file ~/deployment/bosh.pem
```

2. Make yourself root
```
sudo su
```

3. Navigate to root bosh directory `/var/vcap` and explore it content

4. View all installed jobs
```
cd /var/vcap/jobs/
```
Select some job and explore its content.

5. View all installed packages
```
cd /var/vcap/packages
```
Select some package and explore its content.

6. View monit files
```
cd /var/vcap/monit
```
Also observer monit status
```
monit status
```

7. View logs
```
cd /var/vcap/sys/log
```
