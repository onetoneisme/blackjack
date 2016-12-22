## Install PostgreSQL DB

1. Add PostgreSQL Apt Repository.
  ```exec
  sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
  wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -
  ```

1. Install PostgreSQL.
  ```exec
  sudo apt-get update
  sudo apt-get install -y postgresql postgresql-contrib
  ```
1. Set root password
  ```
  sudo -u postgres psql
  ALTER USER postgres with encrypted password 'some_password';
  \q
  ```

1. Configure postgres to allow remote connections.
  ```exec
  sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '\*'/g" /etc/postgresql/9.6/main/postgresql.conf 
  sudo bash -c 'echo "host  all  all 0.0.0.0/0 md5" > /etc/postgresql/9.6/main/pg_hba.conf'
  sudo service postgresql restart 
  ```

1. Save DB connection URL.
  ```exec
  mkdir ~/deployment
  pg_url=postgresql://postgres:some_password@{{curl --silent http://169.254.169.254/latest/meta-data/public-ipv4}}:5432/postgres

  echo "export pg_url=$pg_url" > ~/deployment/vars
  ```
