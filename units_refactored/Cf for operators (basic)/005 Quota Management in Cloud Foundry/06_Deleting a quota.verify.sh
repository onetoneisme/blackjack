#!/bin/bash -e

check 'cf quotas' '.*small-quota.*' false #>Quota "small-quota" wasn't deleted.
