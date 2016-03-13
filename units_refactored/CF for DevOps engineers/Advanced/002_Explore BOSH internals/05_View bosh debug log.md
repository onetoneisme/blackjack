## View bosh debug log

1. Find out task number
```
bosh tasks
```

For task that are already completed
```
bosh tasks recent
```

2. View task info
```
bosh task <number>
```

3. View task debug log
```
bosh task <number> --debug
```
