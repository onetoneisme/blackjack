## Connect to Director database

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

3. Install postgreesql client
```
sudo apt-get update
sudo apt-get install postgresql-client
```

4. View Bosh settings file `/var/vcap/bosh/settings/json` and find out db information

5. Connect to bosh database
```
psql -h 127.0.0.1 -p 5432 bosh postgres
```

6. List all tables
```
\d
```
Use `\q` to exit table list.

7. View content of releases table
```
SELECT * FROM releases;
```

8. Use `\q` to exit the client.
