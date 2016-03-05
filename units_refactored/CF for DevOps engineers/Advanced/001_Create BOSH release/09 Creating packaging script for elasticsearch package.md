## Creating packaging script for elasticsearch package


Edit the following file `packages/elasticsearch/packaging` and add the following content to it

```
# abort script on any command that exit with a non zero value
set -e

VERSION=0.90.2

tar xvf elasticsearch/elasticsearch-${VERSION}.tar.gz

cp -a elasticsearch-${VERSION}/. $BOSH_INSTALL_TARGET
```
