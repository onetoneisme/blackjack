#!/bin/bash -e

check 'cf target -o training; cf spaces' 'test-space' true #> The space was not created or was created with a different name.
