#!/bin/bash -e

check 'cat ~/deployment/greeter.yml' 'greeter' #> greeter deployment manifest is not filled correctly
