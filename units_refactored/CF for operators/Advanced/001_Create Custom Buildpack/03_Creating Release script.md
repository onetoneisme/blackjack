## Creating a release script

1. Create the file `bin/release` with the following content:
	```
	#!/usr/bin/env bash

	cat << EOF
	default_process_types:
	  web: sh boot.sh 
	EOF
	```
