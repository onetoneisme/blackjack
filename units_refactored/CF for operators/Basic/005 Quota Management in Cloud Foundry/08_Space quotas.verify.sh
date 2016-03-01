#!/bin/bash -e

check 'cf space my-first-space' 'Quota:.*small-space-quota' true #>Space quota "small-space-quota" not assigned to Space "my-first-space"
