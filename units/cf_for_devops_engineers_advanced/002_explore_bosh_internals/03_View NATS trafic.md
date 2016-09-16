## View NATS traffic


1. SSH to a BOSH instance: 
    ```
    cd ~/deployment/
    ssh -i bosh.pem vcap@{{source ~/deployment/vars && echo $eip}}
    ```

2. Make yourself root:
    ```
    sudo su
    ```
    The password is `c1oudc0w`.

3. View the BOSH Director config to find out what the NATS connection string is:
    ```
    vi /var/vcap/jobs/director/config/director.yml
    ```
    Use `:q` to exit _vim_.

3. Use the `nats-sub` command from the `nats` package to subscribe to NATS:
    ```
    export PATH=/var/vcap/packages/ruby/bin:$PATH
    export BUNDLE_GEMFILE=/var/vcap/packages/nats/Gemfile  
    bundle exec nats-sub '>' -s 'nats://nats:nats-password@127.0.0.1:4222' 
    ```

4. Filter output^ subscribe only on messages that Director sends to agents:
    ```
    bundle exec nats-sub 'agent.>' -s 'nats://nats:nats-password@127.0.0.1:4222' 
    ```

5. Use `bosh vms` in another window to make Director send some messages to agents.
