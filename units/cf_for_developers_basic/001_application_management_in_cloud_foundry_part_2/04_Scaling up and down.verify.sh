#!/bin/bash -e

check 'cf apps' 'my-app.*64M' true #> Memroy limit of "my-app" incorrect.
