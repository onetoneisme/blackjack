## Creating a compile script

1. Create the file `bin/compile` with the following content:
	```
	#!/usr/bin/env bash
	# bin/compile <build-dir> <cache-dir>

	set -e            # fail fast

	status() {
	  echo "-----> $*"
	}

	# Configure directories
	build_dir=$1
	cache_dir=$2

	status "Moving application content into public folder"
	cd $build_dir
	mkdir public
	shopt -s extglob dotglob
	mv !(public) public 

	status "Installing static web server"
	wget -q -O static-fileserver  https://github.com/s-matyukevich/static-fileserver/blob/master/bin/static-fileserver?raw=true 
	chmod +x static-fileserver

	status "Creating boot script"
	cat > boot.sh << \EOF
	setsid $HOME/static-fileserver -p $PORT -d $HOME/public > out 2>out.err
	EOF
	chmod +x boot.sh

	echo "static"
	exit 0

	```
