#!/bin/bash -e

check 'cf quotas' '.*small-quota.*' true #>Quota "small-quota" not found.
check 'cf quotas' '.*large-quota.*10G' true #>Quota "large-quota" not found.
