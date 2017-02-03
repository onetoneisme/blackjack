## Creating a detect script

1. Create a new folder for the buildpack:
  ```exec
  mkdir ~/custom_buildpack
  cd ~/custom_buildpack
  mkdir bin
  ```
Now you should refresh the file directory to see the created folder. 

2. Create the file `bin/detect` with the following content:
  ```file=~/custom_buildpack/bin/detect
  #!/usr/bin/env bash
  # bin/detect <build-dir>

  if [ -f $1/Staticfile ]; then
    echo "staticfile" && exit 0
  else
    echo "no" && exit 1
  fi
  ``` 
