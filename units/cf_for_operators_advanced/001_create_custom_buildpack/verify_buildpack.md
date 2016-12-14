## Verify the buildpack

1. Install git
  ```
  sudo apt-get update
  sudo apt-get install git -y
  ```

1. Download a static application:
  ```
  cd ~
  git clone https://github.com/s-matyukevich/iot-dashboard
  ``` 

2. Add `Staticfile` to the appliction to make the buildpack recognize it:
  ```
  cd ~/iot-dashboard
  touch Staticfile
  ```

3. Deploy the application:
  ```
  cf push static
  ```
