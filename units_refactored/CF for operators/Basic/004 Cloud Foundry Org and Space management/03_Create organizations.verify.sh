#!/bin/bash -e

check 'cf orgs' 'my-org' true #> Organization 'my-org' wasn't found
