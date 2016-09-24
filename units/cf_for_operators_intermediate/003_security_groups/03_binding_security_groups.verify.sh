#!/bin/bash -e

check 'cf security-group mysql-sg' 'my-org.*my-first-space' true #> The security group 'mysql-sg' was not assigned to the org 'my-org' and space 'my-frst-space'
