## Package and upload the buildpack

1. Install `zip`:
  ```
  sudo apt-get install zip
  ```

2. Add executable permissions:
  ```
  chmod +x ~/custom_buildpack/bin/*
  ```

3. Package the buildpack:
  ```
  cd ~
  zip -r custom_buildpack.zip custom_buildpack/
  ```

4. Login to Cloud Foundry (the default user/password in the manifest were `admin/admin`):
  ```
  cf login
  ```

5. Upload the buildpack:
  ```
  cf create-buildpack custom_buildpack custom_buildpack.zip 1
  ```

6. See the available buildpacks:
  ```
  cf buildpacks
  ```
