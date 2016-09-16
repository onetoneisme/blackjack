## Install [spiff](https://github.com/cloudfoundry-incubator/spiff)

1. Download spiff binary and install it locally.
  ```
  wget https://github.com/cloudfoundry-incubator/spiff/releases/download/v1.0.7/spiff_linux_amd64
  sudo install -m0755 spiff_linux_amd64 /usr/local/bin/spiff
  rm spiff_linux_amd64
  ```

2. Verify spiff installation.
  ```
  spiff -v
  ```
