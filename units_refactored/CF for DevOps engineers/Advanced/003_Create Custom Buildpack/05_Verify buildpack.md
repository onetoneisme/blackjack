## Verify buildpack

1. Download some static application
```
cd ~
git clone https://github.com/s-matyukevich/iot-dashboard
``` 

2. Add `Staticfile` to our appliction to make buildpack recognize it
```
cd ~/iot-dashboard
touch Staticfile
```
3. Log in to CloudFoundry (default user/password in manifest was admin/admin)
```
cf login
```
4. Deploy our application
```
cf push static
```
