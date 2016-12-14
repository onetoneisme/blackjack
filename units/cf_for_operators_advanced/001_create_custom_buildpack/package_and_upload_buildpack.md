## Package and upload the buildpack

1. Install `zip`:
  ```
  sudo apt-get install zip
  ```

1. Add executable permissions:
  ```
  chmod +x ~/custom_buildpack/bin/*
  ```

1. Package the buildpack:
  ```
  cd ~
  zip -r custom_buildpack.zip custom_buildpack/
  ```

1. Install CF cli
  ```
  curl -o cf_cli.deb -J -L 'https://cli.run.pivotal.io/stable?release=debian64&source=github'
  sudo dpkg -i cf_cli.deb
  ```

1. Login to Cloud Foundry (the default user/password in the manifest were `admin/admin`):
  ```
  cf api --skip-ssl-validation https://api.{{echo $CF_DOMAIN}}
  cf login
  ```

1. Create new space and target it.
  ```
  cf create-space test-space
  cf target -s test-space
  ```

1. Upload the buildpack:
  ```
  cf create-buildpack custom_buildpack custom_buildpack.zip 1
  ```

1. See the available buildpacks:
  ```
  cf buildpacks
  ```
