#!/bin/bash -e

groups=( scim.write scim.read uaa.admin cloud_controller.admin )

check 'uaac users | grep MyAdminUser' 'MyAdminUser' true #> User 'MyAdminUser' not found

for group in "${groups[@]}"
do
  cmd="uaac user get MyAdminUser | grep $group"
  verifier="display: $group"
  echo Verifying $group with $cmd
  check "$cmd" "$verifier" true #> User 'MyAdminUser' doesn't have the right permissions set
done
