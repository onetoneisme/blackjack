#!/bin/bash -e

check 'cf security-groups' 'mysql-sg' true #> 'mysql-sg' security group can't be found.
