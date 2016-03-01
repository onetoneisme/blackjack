#!/bin/bash -e

check 'cf services' 'my-sinatra-app-db.*' true #> "my-sinatra-app-db" service not found.
