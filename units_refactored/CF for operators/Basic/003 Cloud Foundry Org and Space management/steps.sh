#!/bin/bash -e

CF_DOMAIN=54.164.224.55.xip.io

echo Running commands for unit: 003 Cloud Foundry Org and Space management

cf auth admin admin
cf create-org my-org
check 'cf orgs' 'my-org' true #> Organization 'my-org' wasn't foundcf rename-org my-org my-renamed-org
cf delete-org my-renamed-org
check 'cf orgs' 'my-org' false #> Organization 'my-org' wasn't renamedcheck 'cf orgs' 'my-renamed-org' false #> Organization 'my-renamed-org' wasn't deletedcf create-org my-org
cf target -o my-org
cf spaces
check 'cf orgs' 'my-org' true #> Organization 'my-org' wasn't foundcheck 'cf target' 'Org:.*my-org' true #> Organization 'my-org' wasn't targetedcf create-space my-first-space
check 'cf spaces' 'my-first-space' true #> Space 'my-first-space' wasn't found.cf space my-first-space
cf create-space my-second-space
cf rename-space my-second-space my-trash-space
cf delete-space my-trash-space
check 'cf spaces' 'my-trash-space' true #> Space 'my-trash-space' wasn't deleted