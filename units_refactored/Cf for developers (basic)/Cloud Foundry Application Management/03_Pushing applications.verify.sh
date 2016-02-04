#!/bin/bash -e

check 'cf apps | grep --color=never my-sinatra-example' 'my-sinatra-example   started .*  my-sinatra-example.127.0.0.1.xip.io' true #> Application my-sinatra-example is not installed.
