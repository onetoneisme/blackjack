## Install AWS CLI

The AWS Command Line Interface is a unified tool to manage your AWS services. With just one tool to download and configure, you can control multiple AWS services from the command line and automate them through scripts.

1. Install unzip
```
sudo apt-get install -y unzip
```

2. Install the AWS CLI
```
curl -O https://s3.amazonaws.com/aws-cli/awscli-bundle.zip
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
```

3. Configure the AWS CLI
```
aws configure
```
Enter your AWS credentials and default region (for example, us-west-1).