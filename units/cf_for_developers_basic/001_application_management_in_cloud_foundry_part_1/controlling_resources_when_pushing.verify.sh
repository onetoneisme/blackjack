#!/bin/bash -e

check 'cf apps' 'my-sinatra-app *started *1/1 *256M *128M *my-sinatra-app.*' true #> The application my-sinatra-app is not installed or is installed with wrong limits.
