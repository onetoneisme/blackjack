## Verify the buildpack

1. Install git
  ```exec
  sudo apt-get update
  sudo apt-get install git -y
  ```

1. Download a static application:
  ```exec
  cd ~
  git clone https://github.com/s-matyukevich/iot-dashboard
  ``` 

2. Add `Staticfile` to the appliction to make the buildpack recognize it:
  ```exec
  cd ~/iot-dashboard
  touch Staticfile
  ```

3. Deploy the application:
  ```exec
  cf push static
  ```
