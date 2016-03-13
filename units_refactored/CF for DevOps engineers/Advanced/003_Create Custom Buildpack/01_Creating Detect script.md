## Creating Detect script

1. Create new folder for buildpack

```
mkdir ~/custom_buildpack
cd ~/custom_buildpack
mkdir bin
```

2. Create file `bin/detect` with the following content

```
#!/usr/bin/env bash
# bin/detect <build-dir>

if [ -f $1/Staticfile ]; then
  echo "staticfile" && exit 0
else
  echo "no" && exit 1
fi
``` 
