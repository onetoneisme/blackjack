#!/bin/bash -e

CF_DOMAIN=54.164.224.55.xip.io

echo Running commands for unit: 004 Cloud Foundry User Management

cf create-user my-user "my-password"
cf delete-user my-user -f
cf create-user my-user "my-password"
cf set-org-role my-user my-org OrgAuditor
cf set-space-role my-user my-org my-first-space SpaceDeveloper
check 'cf org-users my-org' 'ORG AUDITOR.*my-user' true #>User "my-user" not found or not assigned as ORG AUDITOR.check 'cf space-users my-org my-first-space' 'SPACE DEVELOPER.*my-user' true #>User "my-user" not found or not assigned as SPACE DEVELOPERcf org-users my-org
cf space-users my-org my-first-space
cf unset-space-role admin my-org my-first-space SpaceDeveloper
check 'cf space-users my-org my-first-space' 'SPACE DEVELOPER.*admin' true #>User "admin" still assigned to SPACE DEVELOPER