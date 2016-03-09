#!/bin/bash -e

source deployment/vars
check 'echo $cf_subnet_id' 'subnet.*' true #> cf_subnet_id variable should be set  
source deployment/vars
check 'echo $cf_eip_id' 'eipalloc.*' true #> cf_eip_id variable should be set  
source deployment/vars
check 'echo $cf_eip' '^$' false #> cf_eip variable should be set  
source deployment/vars
check 'echo $nat_gateway_id' 'nat.*' true #> nat_gateway_id variable should be set  
source deployment/vars
check 'echo $route_table_id' 'rtb.*' true #> route_table_id variable should be set  
source deployment/vars
check 'echo $cf_sg_id' 'sg.*' true #> cf_sg_id variable should be set  
