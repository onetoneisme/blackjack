#!/bin/bash -e

check 'cf apps' 'my-app.*/2' true #> The number of instances of "my-app" is incorrect.
