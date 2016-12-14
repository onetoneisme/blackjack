## Create a DB instance on the AWS RDS

1. Create a security group that accepts only 5432 port connections which is default for PostgreSQL.
  ```
  pg_sg=$(aws ec2 create-security-group --group-name pgsql --description "PostgreSQL Security Group" --query GroupId --output text)
  aws ec2 authorize-security-group-ingress --group-id $pg_sg --ip-permissions '[{"IpProtocol": "tcp", "FromPort": 5432, "ToPort": 5432, "IpRanges": [{"CidrIp": "0.0.0.0/0"}]}]'
  ```

1. Create a DB instance.
  ```
  aws rds create-db-instance --engine postgres --db-instance-identifier mydb --db-instance-class db.t2.micro  --master-username johndoe --master-user-password c1oudc0w --availability-zone us-west-2c --allocated-storage 5 --vpc-security-group-ids $pg_sg --backup-retention-period 0 --port 5432
  ```

1. Wait some time while the AWS is creating your DB, usually it takes from 1 to 5 minutes.
  ```
  pg_host=$(aws rds describe-db-instances --query 'DBInstances[0].Endpoint.Address' --output text)
  ```

1. Check that the `$pg_host` is not `null` if it is repeat the previous step in some time.
  ```
  echo $pg_host
  ```

1. Save DB connection URL.
  ```
  mkdir ~/deployment
  pg_url=postgresql://johndoe:c1oudc0w@$pg_host:5432/postgres

  echo "export pg_url=$pg_url" > ~/deployment/vars
  ```
