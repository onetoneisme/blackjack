#!/bin/bash -e
check 'cf space-users training test-space' 'SPACE DEVELOPER.*[a-zA-Z].*test-user' true #> SpaceDeveloper role was not set for user "test-user"
