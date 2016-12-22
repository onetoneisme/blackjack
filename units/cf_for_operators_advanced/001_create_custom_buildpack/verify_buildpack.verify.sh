#!/bin/bash -e

check 'cf apps' 'static' true #> Static app not found.
