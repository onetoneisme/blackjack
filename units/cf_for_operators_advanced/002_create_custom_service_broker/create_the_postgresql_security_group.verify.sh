#!/bin/bash -e

check 'cat ~/deployment/postgresql.json' '5432' true #> postgresql.json not found.
check 'cf security-groups' 'postgresql' true #> postgresql security group not found.
