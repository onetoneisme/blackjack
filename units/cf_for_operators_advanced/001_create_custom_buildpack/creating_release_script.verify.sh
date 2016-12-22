#!/bin/bash -e

check 'cat ~/custom_buildpack/bin/release' '/usr/bin/env bash' true #> Release script not found.
