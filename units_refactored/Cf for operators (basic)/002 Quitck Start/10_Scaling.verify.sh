#!/bin/bash -e

check 'cf apps' '.*Sinatra-Example-app.*started.*1/1.*' true #> App "Sinatra-Example-app" not found, not started or instances are not set to 1
