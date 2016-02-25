## Install AWS CLI

The AWS Command Line Interface is a unified tool to manage your AWS services. With just one tool to download and configure, you can control multiple AWS services from the command line and automate them through scripts.

1. Install unzip command
```
sudo apt-get install -y unzip
```

2. Install AWS CLI
```
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
```

3. Configure AWS CLI
```
aws configure
```
Enter your aws credentials and default regions (for example, us-west-1)
