#!/bin/bash -e

CF_DOMAIN=54.164.224.55.xip.io

echo Running commands for unit: 005 Quota Management in Cloud Foundry

cf quotas
cf quota default
cf help create-quota
cf create-quota small-quota -i 512M -m 2048M -r 10 -s 5
cf create-quota large-quota -i 2048M -m 10G -r 100 -s 20 --allow-paid-service-plans
check 'cf quotas' '.*small-quota.*' true #>Quota "small-quota" not found.check 'cf quotas' '.*large-quota.*10G' true #>Quota "large-quota" not found.cf update-quota large-quota --disallow-paid-service-plans
cf update-quota small-quota -i 256M -s 2
check 'cf space-quotas' 'small-space-quota.*2G.*128M.*' true #>Space quota "small-space-quota" doesn't exists or instance memory limit not set to 128Mcf delete-quota small-quota
check 'cf quotas' '.*small-quota.*' false #>Quota "small-quota" wasn't deleted.cf set-quota my-org large-quota
cf org my-org
check 'cf org my-org' 'quota:.*large-quota' true #>Quota "large-quota" not assigned to Org "my-org"cf create-space-quota small-space-quota -i 512M -m 2048M -r 10 -s 5
cf update-space-quota small-space-quota -i 128M
cf set-space-quota my-first-space small-space-quota
cf space my-first-space
cf unset-space-quota my-first-space small-space-quota
check 'cf space my-first-space' 'Quota:.*small-space-quota' true #>Space quota "small-space-quota" not assigned to Space "my-first-space"