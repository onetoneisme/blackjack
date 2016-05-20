## Creating a detect script

1. Create a new folder for the buildpack:
	```
	mkdir ~/custom_buildpack
	cd ~/custom_buildpack
	mkdir bin
	```

2. Create the file `bin/detect` with the following content:
	```
	#!/usr/bin/env bash
	# bin/detect <build-dir>

	if [ -f $1/Staticfile ]; then
	  echo "staticfile" && exit 0
	else
	  echo "no" && exit 1
	fi
	``` 
