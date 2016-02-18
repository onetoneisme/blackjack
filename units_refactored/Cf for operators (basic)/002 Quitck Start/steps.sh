#!/bin/bash -e

CF_DOMAIN=54.164.224.55.xip.io

echo Running commands for unit: 002 Quitck Start

cf api --skip-ssl-validation https://api.$CF_DOMAIN
check 'cf target | grep --color=never "API endpoint"' '.*API version.*' true #> Cloud Foundry is not set or is set incorrectly.check 'cf target | grep --color=never "User"' 'User:           admin' true #> You are not logged in with correct user.cf create-user test-user "test-password"
cf create-org training
check 'cf orgs' 'training' true #> The organization was not created or was created with a different name.cf create-space test-space -o training
check 'cf spaces' 'test-space' true #> The space was not created or was created with a different name.cf set-space-role test-user training test-space SpaceDeveloper
cf auth test-user "test-password"
check 'cf target' 'User:.*test-user' true #> Current user not 'test-user'check 'cf space-users training test-space' 'SPACE DEVELOPER.*[a-zA-Z].*test-user' true #> SpaceDeveloper role was not set for user "test-user"cf target -o training -s test-space
check 'cf target | grep --color=never "Org"' 'training' true #> Org not targeted correctly.check 'cf target | grep --color=never "Space"' 'test-space' true #> Space not targeted correctly.git clone https://github.com/Altoros/cf-example-sinatra
cf-app push Sinatra-Example-app
check 'cf apps | grep --color=never "Applications"' 'Sinatra-Example-app' true #> Application not deployed or deployed with a different name.check 'cf apps' '.*Sinatra-Example-app.*started.*1/1.*' true #> App "Sinatra-Example-app" not found, not started or instances are not set to 1