#!/bin/bash -e

check 'cf orgs' 'training' true #> The organization was not created or was created with a different name.
