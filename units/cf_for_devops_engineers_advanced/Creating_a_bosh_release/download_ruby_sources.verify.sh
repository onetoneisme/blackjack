#!/bin/bash -e

if [ ! -f ~/greeter-release/blobs/ruby/ruby-2.3.0.tar.gz ]; then
  echo "not found"
fi #> Ruby sources not found.
if [ ! -f ~/greeter-release/blobs/ruby/bundler-1.11.2.gem ]; then
  echo "not found"
fi #> Bundler not found.
