#!/bin/bash -e

check 'cf org-users my-org' 'ORG AUDITOR.*my-user' true #>User "my-user" not found or not assigned as ORG AUDITOR.
check 'cf space-users my-org my-first-space' 'SPACE DEVELOPER.*my-user' true #>User "my-user" not found or not assigned as SPACE DEVELOPER
