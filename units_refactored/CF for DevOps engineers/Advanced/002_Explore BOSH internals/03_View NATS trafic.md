## View NATS trafic


1.  SSH to Bosh instance 
```
cd ~/deployment/
ssh -i bosh.pem vcap@{{source ~/deployment/vars && echo $eip}}
```

2. Make yourself root
```
sudo su
```
Password is `c1oudc0w`

3. View BOSH Director config to find out NATS connection string
```
vi /var/vcap/jobs/director/config/director.yml
```
Use `:q` to exit vim.

3. Use nats-sub command from nats package to subscribe to nats
```
export PATH=/var/vcap/packages/ruby/bin:$PATH
export BUNDLE_GEMFILE=/var/vcap/packages/nats/Gemfile  
bundle exec nats-sub '>' -s 'nats://nats:nats-password@127.0.0.1:4222' 
```

4. Filter output^ subscribe only on messages, that director send to agents
```
bundle exec nats-sub 'agent.>' -s 'nats://nats:nats-password@127.0.0.1:4222' 
```

5. Use `bosh vms` in another vindow to make director send some messages to agents 
