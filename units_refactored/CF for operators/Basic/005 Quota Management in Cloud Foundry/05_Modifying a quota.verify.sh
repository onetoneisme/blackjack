#!/bin/bash -e

check 'cf space-quotas' 'small-space-quota.*2G.*128M.*' true #>Space quota "small-space-quota" doesn't exists or instance memory limit not set to 128M
