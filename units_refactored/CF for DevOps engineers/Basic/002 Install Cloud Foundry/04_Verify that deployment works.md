### Verify the deployment works

1. Install the cf cli
```
curl -o cf_cli.deb -J -L 'https://cli.run.pivotal.io/stable?release=debian64&source=github'
sudo dpkg -i cf_cli.deb
```

2.  Connect to CF
```
cf api --skip-ssl-validation api.{{source ~/deployment/vars &&  echo $cf_eip}}.xip.io
```

3. Prepare the manifest to run CATS

    Add the following job to the manifest (at the and of global "jobs" section):
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
      Also add the following to the `properties` section of the manifest (at the and of global "properties" section):
```
  acceptance_tests:
    api: api.{{source ~/deployment/vars && echo $cf_eip}}.xip.io
    apps_domain: {{source ~/deployment/vars && echo $cf_eip}}.xip.io
    admin_user: admin
    admin_password: admin
    skip_ssl_validation: true
    system_domain: {{source ~/deployment/vars && echo $cf_eip}}.xip.io
```

4. Redeploy
```
bosh deploy
```

5. Run CATS (this can take a while)
```
bosh run errand acceptance_tests --download-logs
```
