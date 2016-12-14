### Install the AWS CLI

The AWS Command Line Interface (CLI) is a unified tool to manage your AWS services. With just one tool to download and configure, you can control multiple AWS services from the command line and automate them through scripts.

1. Install prerequisites packages
  ```
  sudo apt-get -y install python-dev
  ```

1. Install the AWS CLI:
  ```
  curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
  unzip awscli-bundle.zip
  sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
  rm awscli-bundle* -rf
  ```

1. Configure the AWS CLI:
  ```
  aws configure
  ```
  Enter your AWS credentials and the default region (for example, `us-west-1`).
