#!/bin/bash -e

check 'cf org my-org' 'quota:.*large-quota' true #>Quota "large-quota" not assigned to Org "my-org"
