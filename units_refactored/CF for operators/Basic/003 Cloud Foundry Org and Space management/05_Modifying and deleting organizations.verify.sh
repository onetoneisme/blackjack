#!/bin/bash -e

check 'cf orgs' 'my-org' false #> Organization 'my-org' wasn't renamed
check 'cf orgs' 'my-renamed-org' false #> Organization 'my-renamed-org' wasn't deleted
