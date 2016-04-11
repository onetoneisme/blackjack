#!/bin/bash -e

check 'cf space-users my-org my-first-space' 'SPACE DEVELOPER.*admin' false #>User "admin" still assigned to SPACE DEVELOPER
