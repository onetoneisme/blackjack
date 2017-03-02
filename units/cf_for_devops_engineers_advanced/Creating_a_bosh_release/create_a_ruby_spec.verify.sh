#!/bin/bash -e

check 'cat ~/greeter-release/packages/ruby/spec' 'ruby-2.3.0' #> ruby spec is not filled correctly
