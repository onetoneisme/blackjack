#!/bin/bash -e

check 'cf apps | grep --color=never my-sinatra-app' 'my-sinatra-app       started           1/1         512M     128M   my-sinatra-app.*' true #> Application my-sinatra-app is not installed or is installed with wrong limits.
