#!/bin/bash -e

check 'cf services' 'my-fictional-service.*' true #> "my-fictional-service" service not found.
check 'cf services' 'my-fictional-service.*my-app' true #> Service "my-fictional-service" not bound to "my-app"
