#!/bin/bash -e

check 'cf services' 'my-sinatra-app-db' true #> Service "my-sinatra-app-db" still exists
check 'cf services' 'my-sinatra-app-db.*1gb.*my-app' false #> Service "my-sinatra-app-db" still bound to "my-app"
