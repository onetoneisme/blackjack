#!/bin/bash -e

check 'cat ~/greeter-release/packages/greeter/spec' 'ruby' #> greeter spec is not filled correctly
