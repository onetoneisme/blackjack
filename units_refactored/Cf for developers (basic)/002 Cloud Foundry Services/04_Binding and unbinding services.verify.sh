#!/bin/bash -e

check 'cf services' 'my-app-db.*100mb.*my-app' true #> Service "my-app-db" not bound to "my-app"
