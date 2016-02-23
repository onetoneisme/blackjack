#!/bin/bash -e

check 'cf services' 'my-sinatra-app-db.*1gb' true #> Service "my-app-db" is of a wrong plan.
