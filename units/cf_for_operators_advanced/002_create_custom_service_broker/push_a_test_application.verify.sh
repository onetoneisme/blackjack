#!/bin/bash -e

check "curl --silent  \$(cf app pg-app | grep urls: | awk '{print \$2}')" 'PostgreSQL' true #> pg-app don't deisplay postgresql version.
