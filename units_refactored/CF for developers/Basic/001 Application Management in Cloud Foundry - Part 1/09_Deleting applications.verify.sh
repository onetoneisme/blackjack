#!/bin/bash -e

check 'cf apps | grep --color=never my-app' '^$' true #> Application is not deleted
