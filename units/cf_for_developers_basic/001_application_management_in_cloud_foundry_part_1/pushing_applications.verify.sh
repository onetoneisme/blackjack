#!/bin/bash -e

check 'cf apps' 'my-sinatra-app *started .*my-sinatra-app.*' true #> The application my-sinatra-example is not installed.
