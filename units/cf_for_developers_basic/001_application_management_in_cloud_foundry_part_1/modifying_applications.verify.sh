#!/bin/bash -e

check 'cf apps' 'my-app .*  my-sinatra-app.*' true #> The application has not been renamed.
