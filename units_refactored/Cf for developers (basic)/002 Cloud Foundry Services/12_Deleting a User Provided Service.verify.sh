#!/bin/bash -e

check 'cf services' 'my-other-fictional-service.*' true #> "my-other-fictional-service" service exists.
