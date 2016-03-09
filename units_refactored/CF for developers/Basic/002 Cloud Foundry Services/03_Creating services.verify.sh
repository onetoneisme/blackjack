#!/bin/bash -e

check 'cf services' 'my-app-db.*' true #> "my-app-db" service not found.
check 'cf services' 'my-app-db.*100mb' true #> Service "my-app-db" is of a wrong plan.
