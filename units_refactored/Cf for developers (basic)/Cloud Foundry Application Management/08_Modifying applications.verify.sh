#!/bin/bash -e

check 'cf apps | grep --color=never my-app' 'my-app .*  my-sinatra-app.127.0.0.1.xip.io' true #> Application is not renamed.
