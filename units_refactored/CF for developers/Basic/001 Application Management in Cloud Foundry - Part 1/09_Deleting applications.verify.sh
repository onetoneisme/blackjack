#!/bin/bash -e

check 'cf apps | grep --color=never my-app' 'my-app .*  my-sinatra-app.*' false #> The application has not been renamed.
