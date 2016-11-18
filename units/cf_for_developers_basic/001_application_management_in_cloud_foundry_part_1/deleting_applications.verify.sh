#!/bin/bash -e

if cf apps | grep -q my-app; then
  echo "application my-app found"
fi #> The application has not been deleted.
