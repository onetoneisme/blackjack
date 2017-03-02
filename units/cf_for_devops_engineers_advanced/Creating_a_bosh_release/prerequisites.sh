#!/bin/bash -e

source .profile
check 'bosh env' 'my-bosh' true #> You should log in to bosh director
