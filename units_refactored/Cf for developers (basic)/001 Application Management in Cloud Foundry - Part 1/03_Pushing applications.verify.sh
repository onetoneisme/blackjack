#!/bin/bash -e

check 'cf apps | grep --color=never my-sinatra-example' 'my-sinatra-example   started .*  my-sinatra-example.*' true #> Application my-sinatra-example is not installed.
