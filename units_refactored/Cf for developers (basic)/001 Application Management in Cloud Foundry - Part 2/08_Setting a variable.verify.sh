#!/bin/bash -e

check 'cf env my-app' 'MYVAR: myvalue' true #> User defined variable "MYVAR" not found.
