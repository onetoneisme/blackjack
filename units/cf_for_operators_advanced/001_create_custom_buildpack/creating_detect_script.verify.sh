#!/bin/bash -e

check 'cat ~/custom_buildpack/bin/detect' '/usr/bin/env bash' true #> Detect script not found.
