## Create base application structure

1. Create application directory
  ```exec
  mkdir -p ~/go/src/github.com/vcap/cf-postgresql-broker
  cd ~/go/src/github.com/vcap/cf-postgresql-broker
  ```

1. Create the `Procfile` file in the cf-postgresql-broker folder with the following content:
  ```file=~/go/src/github.com/$USER/cf-postgresql-broker/Procfile
  web: cf-postgresql-broker
  ```

1. Create the `manifest.yml` file with the following content:
  ```file=~/go/src/github.com/$USER/cf-postgresql-broker/manifest.yml
  ---
  env:
    GOPACKAGENAME: cf-postgresql-broker
  ```

