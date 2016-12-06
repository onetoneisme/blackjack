#!/bin/bash -e

check 'cf services' 'my-app-db.*512mb.*my-app' true #> Service "my-app-db" not bound to "my-app"
