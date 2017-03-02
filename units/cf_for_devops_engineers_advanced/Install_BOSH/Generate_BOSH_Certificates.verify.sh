#!/bin/bash -e

check 'cat deployment/certs/bosh-key.pem' '-----BEGIN RSA PRIVATE KEY-----.*' true #> Bosh key is not found
check 'cat deployment/certs/bosh.crt' '-----BEGIN CERTIFICATE-----.*' true #> Bosh certificate is not found
