#!/bin/bash -e

check 'cat ~/cf-example-sinatra/my-sinatra-app_manifest.yml | grep --color=never name' 'name: my-sinatra-app' true #> The manifest file is not created.
