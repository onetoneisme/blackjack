#!/bin/bash -e

check 'cf orgs | grep --color=never "orgs"' 'training' true #> The organization was not created or was created with a different name.
