#!/bin/bash -e

check 'cf apps' 'Sinatra-Example-app' true #> Application not deployed or deployed with a different name.
