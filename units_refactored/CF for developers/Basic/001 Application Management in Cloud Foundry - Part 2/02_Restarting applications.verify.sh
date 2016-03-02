#!/bin/bash -e

check 'cf apps' 'my-app.*started' true #> "my-app" application not found or not running.
