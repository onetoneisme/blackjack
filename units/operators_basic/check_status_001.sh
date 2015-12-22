#!/bin/bash

REQUIRED_VERSION_MAJOR=6.1

if hash cf 2>/dev/null; then
  cf_version=$(cf --version)
  if [[ $cf_version != "cf version $REQUIRED_VERSION_MAJOR"* ]]; then
    echo "CF client version differs from required"
    exit 1
  fi
else
  echo "CF client not found in path"
  exit 1
fi
