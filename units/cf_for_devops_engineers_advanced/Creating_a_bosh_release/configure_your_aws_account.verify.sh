#!/bin/bash -e

check 'cat ~/deployment/vars' 'greeter_sg' #> greeter security group is not created 
check 'cat ~/deployment/vars' 'eip_greeter' #> greeter elasic ip is not created 
