#!/bin/bash -e

check 'cf apps | grep --color=never my-app' 'my-app .*  my-sinatra-app.*' true #> Application is not renamed.
