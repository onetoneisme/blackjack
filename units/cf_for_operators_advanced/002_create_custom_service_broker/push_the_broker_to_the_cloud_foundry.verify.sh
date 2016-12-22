#!/bin/bash -e

check 'cf marketplace' 'postgresql' true #> postgresql service is not added to the marketplace.
