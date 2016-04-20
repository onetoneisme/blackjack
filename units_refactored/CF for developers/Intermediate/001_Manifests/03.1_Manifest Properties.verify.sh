#!/bin/bash -e

check 'cf app my-app | grep running' '.*of 128M.*of 256M' true #> 'my-app' instance memory or disk quota is not set correctly
check 'cf app my-app | grep urls:' 'my-precious-app' true #> 'my-app' host is not set to 'my-precious-app'
