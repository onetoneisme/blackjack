#!/bin/bash -e

check 'cf space-users training test-space | grep --color=never "SPACE DEVELOPER"' 'admin' true #> SpaceDeveloper role was not set for user "admin"
