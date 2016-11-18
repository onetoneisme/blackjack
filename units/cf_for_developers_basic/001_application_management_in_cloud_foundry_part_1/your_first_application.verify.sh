#!/bin/bash -e

check 'cf target' 'API version' true #> Cloud Foundry is not set or is set incorrectly.
check 'cf target' 'admin' true #> You are not logged in with the correct user.
check 'cf target' 'my-org' true #> The org is not selected or is incorrect.
check 'cf target' 'my-space' true #> The space is not selected or is incorrect.
if [ ! -d cf-example-sinatra ]; then
  echo "Not found"
fi #> directory 'cf-example-sinatra' not found
