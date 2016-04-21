### Create the router startup script

Edit the following file `jobs/router/templates/ctl` and add the following content to it

```bash
#!/bin/bash

RUN_DIR=/var/vcap/sys/run/router
LOG_DIR=/var/vcap/sys/log/router

PIDFILE=$RUN_DIR/router.pid
RUNAS=vcap

export PATH=/var/vcap/packages/ruby/bin:$PATH
export BUNDLE_GEMFILE=/var/vcap/packages/greeter/Gemfile
export GEM_HOME=/var/vcap/packages/greeter/gem_home/ruby/2.3.0

function pid_exists() {
  ps -p $1 &> /dev/null
}

case $1 in

  start)
    mkdir -p $RUN_DIR $LOG_DIR
    chown -R $RUNAS:$RUNAS $RUN_DIR $LOG_DIR

    echo $$ > $PIDFILE

    export CONFIG_FILE=/var/vcap/jobs/router/config/config.yml

    exec chpst -u $RUNAS:$RUNAS \
      bundle exec ruby /var/vcap/packages/greeter/router.rb \
      -p <%= p("port") %> \
      -o 0.0.0.0 \
      >>$LOG_DIR/server.stdout.log 2>>$LOG_DIR/server.stderr.log
    ;;

  stop)
    PID=$(head -1 $PIDFILE)
    if [ ! -z $PID ] && pid_exists $PID; then
      kill $PID
    fi
    while [ -e /proc/$PID ]; do sleep 0.1; done
    rm -f $PIDFILE
    ;;

  *)
  echo "Usage: ctl {start|stop}" ;;
esac
exit 0
```
