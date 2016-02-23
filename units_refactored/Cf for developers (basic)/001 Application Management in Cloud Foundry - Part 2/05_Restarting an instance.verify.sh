#!/bin/bash -e

check 'cf apps' 'my-app.*2/2' true #> Number of instances of "my-app" incorrect.
