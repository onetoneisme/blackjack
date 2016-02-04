#!/bin/bash
set -e

APP_URL=$(cf curl /v2/apps | jq -r ".resources[].metadata.url")
APP_NAME=$(cf curl $APP_URL | jq -r ".entity.name")

echo My App name is: $APP_NAME
