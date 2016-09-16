## View the BOSH debug log

1. Find out the task number:
    ```
    bosh tasks
    ```

    For tasks that are have already been completed, use:
    ```
    bosh tasks recent
    ```

2. View task info:
    ```
    bosh task <number>
    ```

3. View the task debug log:
    ```
    bosh task <number> --debug
    ```
