### Create the greeter packaging script

Edit the following file `packages/greeter/packaging` and add the following content to it

```bash
set -e

cp -r greeter/* ${BOSH_INSTALL_TARGET}

cd ${BOSH_INSTALL_TARGET}

find .

mkdir -p ${BOSH_INSTALL_TARGET}/gem_home

/var/vcap/packages/ruby/bin/bundle install --local --no-prune --path ${BOSH_INSTALL_TARGET}/gem_home
```