#!/bin/bash -e

check 'cat ~/go/src/github.com/$USER/cf-postgresql-broker/main.go' 'func \(h Handler\) Services' true #> Services function is not added.
check 'cat ~/go/src/github.com/$USER/cf-postgresql-broker/main.go' 'func \(h Handler\) Provision' true #> Provision function is not added. 
check 'cat ~/go/src/github.com/$USER/cf-postgresql-broker/main.go' 'func \(h Handler\) Deprovision' true #> Deprovision function is not added. 
check 'cat ~/go/src/github.com/$USER/cf-postgresql-broker/main.go' 'func \(h Handler\) Bind' true #> Bind function is not added. 
check 'cat ~/go/src/github.com/$USER/cf-postgresql-broker/main.go' 'func \(h Handler\) Unbind' true #> Unbind function is not added. 
check 'cat ~/go/src/github.com/$USER/cf-postgresql-broker/main.go' 'func \(h Handler\) LastOperation' true #> LastOperation function is not added. 
check 'cat ~/go/src/github.com/$USER/cf-postgresql-broker/main.go' 'func \(h Handler\) Update' true #> Update function is not added. 
