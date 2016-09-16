## A closer look at BOSH Agent 

1. SSH to any BOSH VM:
    ```
    bosh ssh  --gateway_host {{source ~/deployment/vars &&  echo $eip}} --gateway_user vcap --gateway_identity_file ~/deployment/bosh.pem
    ```

2. Make yourself root:
    ```
    sudo su
    ```

3. View Agent settings
    ```
    vi /var/vcap/bosh/settings.json
    ```
