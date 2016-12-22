## Package and upload the buildpack

1. Install `zip`:
  ```exec
  sudo apt-get -y install zip
  ```

1. Add executable permissions:
  ```exec
  chmod +x ~/custom_buildpack/bin/*
  ```

1. Package the buildpack:
  ```exec
  cd ~
  zip -r custom_buildpack.zip custom_buildpack/
  ```

1. Install CF cli
  ```exec
  curl -o cf_cli.deb -J -L 'https://cli.run.pivotal.io/stable?release=debian64&source=github'
  sudo dpkg -i cf_cli.deb
  ```

1. Login to Cloud Foundry (the default user/password in the manifest were `admin/admin`):
  ```exec
  cf api --skip-ssl-validation https://api.{{echo $CF_DOMAIN}}
  cf auth admin admin
  ```

1. Create new space and target it.
  ```exec
  cf create-space -o default_org test-space
  cf target -o default_org -s test-space
  ```

1. Upload the buildpack:
  ```exec
  cf create-buildpack custom_buildpack custom_buildpack.zip 1
  ```

1. See the available buildpacks:
  ```exec
  cf buildpacks
  ```
