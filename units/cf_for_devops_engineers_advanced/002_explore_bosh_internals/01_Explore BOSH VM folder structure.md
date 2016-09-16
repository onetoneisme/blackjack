## Explore the BOSH VM folder structure

Let's take a look at the structure of the BOSH VM:

1. SSH to any BOSH VM with:
    ```
    bosh ssh  --gateway_host {{source ~/deployment/vars &&  echo $eip}} --gateway_user vcap --gateway_identity_file ~/deployment/bosh.pem
    ```

2. Make yourself root:
    ```
    sudo su
    ```

3. Navigate to the root BOSH directory (`/var/vcap`) and explore its contents.

4. View all the installed jobs:
    ```
    cd /var/vcap/jobs/
    ```
    Select some job and explore its contents.

5. View all the installed packages:
    ```
    cd /var/vcap/packages
    ```
    Select some package and explore its contents.

6. View the Monit files:
    ```
    cd /var/vcap/monit
    ```
    Also view Monit status with:
    ```
    monit status
    ```

7. View the logs
    ```
    cd /var/vcap/sys/log
    ```
