## Connect to the Director database

1.  SSH to a BOSH instance:
    ```
    cd ~/deployment/
    ssh -i bosh.pem vcap@{{source ~/deployment/vars && echo $eip}}
    ```

2. Make yourself root:
    ```
    sudo su
    ```
    The password is `c1oudc0w`.

3. Install the PostgreSQL client:
    ```
    sudo apt-get update
    sudo apt-get install postgresql-client
    ```

4. View the BOSH settings file (`/var/vcap/bosh/settings/json`) and find information about the DB.

5. Connect to the BOSH database:
    ```
    psql -h 127.0.0.1 -p 5432 bosh postgres
    ```

6. List all tables:
    ```
    \d
    ```
    Use `\q` to exit the table list.

7. View the contents of the `releases` table:
    ```
    SELECT * FROM releases;
    ```

8. Use `\q` to exit the client.
