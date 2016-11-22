#!/bin/bash -e

check 'cf apps' 'my-app .*my-sinatra-app.*' true #> The application my-sinatra-app is not running.
