### Deploy BOSH

Navigate to the `deployment` directory and execute the following command:

```exec
cd ~/deployment

bosh create-env --var-file=bosh-cert=certs/bosh.crt --var-file=bosh-key=certs/bosh-key.pem --var-file=ca-cert=certs/ca.pem  ~/deployment/bosh.yml
```

Before we will be able to connect to BOSH director, let's set a few environment variables, so that we don't need to repeat them in each command.

```exec
source ~/deployment/vars
cat >> ~/.profile <<EOF
export BOSH_CA_CERT=~/deployment/certs/ca.pem
export BOSH_ENVIRONMENT=$eip
EOF
source ~/.profile
```

And now we can log in to Director using the following command (Credentials are `admin` / `admin`):

```exec
printf "admin\nadmin\n" | bosh log-in
```



