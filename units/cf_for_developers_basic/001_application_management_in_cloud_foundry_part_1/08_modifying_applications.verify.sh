#!/bin/bash -e

check 'cf apps | grep --color=never my-app' 'my-app .*  my-sinatra-app.*' true #> The application has not been renamed.
