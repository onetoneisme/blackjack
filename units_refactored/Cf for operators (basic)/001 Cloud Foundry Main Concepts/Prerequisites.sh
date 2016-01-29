#!/bin/bash -e

check 'curl -I --silent http://api.127.0.0.1.xip.io/v2/info -H "Host: api.127.0.0.1.xip.io" | grep HTTP' 'HTTP/1\.1 200 OK' #> Cf api should be avaliable on api.127.0.0.1.xip.io endpoint. 
