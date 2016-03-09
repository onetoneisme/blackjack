## Verify that deployemnt work

1. Install cf cli
```
curl -o cf_cli.deb -J -L 'https://cli.run.pivotal.io/stable?release=debian64&source=github'
sudo dpkg -i cf_cli.deb
```

2.  Connect to cf
```
cf api --skip-ssl-validation api.{{source ~/deployment/vars &&  echo $cf_eip}}.xip.io
```

3. Prepare manifest to run CATS
Add the following job to the manifest

```
- instances: 1
  lifecycle: errand
  name: acceptance_tests
  networks:
  - name: cf_private
  resource_pool: small_z1
  templates:
  - name: acceptance-tests
    release: cf
```

Also add the following to the `properties` section of the manifest

```
  acceptance_tests:
    api: api.{{source ~/deployment/vars && echo $cf_eip}}.xip.io 
    apps_domain: {{source ~/deployment/vars && echo $cf_eip}}.xip.io
    admin_user: admin
    admin_password: PASSWORD 
    skip_ssl_validation: true
    system_domain: {{source ~/deployment/vars && echo $cf_eip}}.xip.io
```

And finally add the following templates to api job
```
  - {name: go-buildpack, release: cf}
  - {name: binary-buildpack, release: cf}
  - {name: nodejs-buildpack, release: cf}
  - {name: ruby-buildpack, release: cf}
  - {name: python-buildpack, release: cf}
  - {name: staticfile-buildpack, release: cf}
```

4. Redeploy
```
bosh deploy
```

5. Run CATS 
```
bosh run errand  acceptance_tests --download-logs
```
