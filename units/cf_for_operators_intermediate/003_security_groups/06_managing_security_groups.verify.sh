#!/bin/bash -e

check 'cf security-groups' 'mysql-sg' false #> Security group 'mysql-sg' still exists.
