#!/bin/bash -e

check 'cf apps | grep --color=never my-app' '^$' true #> The application has not been deleted.
