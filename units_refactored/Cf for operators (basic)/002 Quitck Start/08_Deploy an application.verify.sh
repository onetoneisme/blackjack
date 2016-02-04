#!/bin/bash -e

check 'cf apps | grep --color=never "Applications"' 'Sinatra-Example-app' true #> Application not deployed or deployed with a different name.
