#!/bin/bash -e

check 'cat ~/custom_buildpack/bin/compile' '/usr/bin/env bash' true #> Compile script not found.
