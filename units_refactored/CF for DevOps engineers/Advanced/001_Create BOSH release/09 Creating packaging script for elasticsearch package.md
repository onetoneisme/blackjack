## Create the packaging script for the elasticsearch package


Edit the file `packages/elasticsearch/packaging` and replace the existing content with the following:

```
# abort this script on any command that exits with a non-zero value
set -e

VERSION=0.90.2

tar xvf elasticsearch/elasticsearch-${VERSION}.tar.gz

cp -a elasticsearch-${VERSION}/. $BOSH_INSTALL_TARGET
```
