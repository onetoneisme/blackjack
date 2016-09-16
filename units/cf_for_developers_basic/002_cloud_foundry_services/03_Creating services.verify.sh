#!/bin/bash -e

check 'cf services' 'my-app-db.*' true #> The "my-app-db" service not found.
check 'cf services' 'my-app-db.*512mb' true #> Service "my-app-db" has a wrong plan.
