#!/bin/bash -e

check 'cf apps' 'my-sinatra-app *started *1/1 *512M *128M *my-sinatra-app.*' true #> The application my-sinatra-app is not installed or is installed with wrong limits.
check 'cat ~/cf-example-sinatra/manifest.yml' 'name: my-sinatra-app' true #> The manifest file is not renamed to 'manifest.yml'.
