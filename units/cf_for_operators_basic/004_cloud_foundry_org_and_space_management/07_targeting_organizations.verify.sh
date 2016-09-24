#!/bin/bash -e

check 'cf orgs' 'my-org' true #> Organization 'my-org' wasn't found
check 'cf target' 'Org:.*my-org' true #> Organization 'my-org' wasn't targeted
