## Verify deployment

1. Test suite should pass
```
bosh run errand smoke_tests
```

2. Install the CF CLI
```
curl -o cf_cli.deb -J -L 'https://cli.run.pivotal.io/stable?release=debian64&source=github'
sudo dpkg -i cf_cli.deb
```

3. Login
```
cf login --skip-ssl-validation -a api.{{source ~/deployment/vars &&  echo $cf_eip}}.xip.io -u admin -p admin
```
