#!/bin/bash -e

check 'uaac -v' '3.*' true #> UAAC not installed or version outdated
