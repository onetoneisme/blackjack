#!/bin/bash -e

check 'cf quotas' 'small-quota.*2G.*256M.*' true #>Space quota "small-space-quota" doesn't exists or instance memory limit not set to 256M
