#!/bin/bash -e
#
check 'cf services | grep my-app' 'my-app-db.*my-app' true #> 'my-app-db' service was not bound to the 'my-app' application.
