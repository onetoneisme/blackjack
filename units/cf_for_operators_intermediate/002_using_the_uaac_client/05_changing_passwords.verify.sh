#!/bin/bash -e

source ~/.profile
check 'uaac context | grep scope' 'password.write' true #> 'password.write' permission has not been set
