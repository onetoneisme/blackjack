#!/bin/bash -e

check 'cf space-users my-org my-first-space' 'SPACE DEVELOPER.*admin' true #>User "admin" still assigned to SPACE DEVELOPER
