### Prepare the deployment manifest

1. Install Git
```
sudo apt-get install git
```

2. Clone the CF release repo
```
cd ~/deployment
git clone https://github.com/cloudfoundry/cf-release/
```

3. Copy and modify the manifest
```
cp ~/deployment/cf-release/example_manifests/minimal-aws.yml ~/deployment
source ~/deployment/vars
sed -i "s/REPLACE_WITH_DIRECTOR_ID/$(bosh status --uuid)/g" ~/deployment/minimal-aws.yml
sed -i "s/REPLACE_WITH_BOSH_SECURITY_GROUP/training_sg/g" ~/deployment/minimal-aws.yml
sed -i "s/REPLACE_WITH_AZ/$(echo $avz)/g" ~/deployment/minimal-aws.yml
sed -i "s/REPLACE_WITH_PRIVATE_SUBNET_ID/$(echo $cf_subnet_id)/g" ~/deployment/minimal-aws.yml
sed -i "s/REPLACE_WITH_PUBLIC_SUBNET_ID/$(echo $subnet_id)/g" ~/deployment/minimal-aws.yml
sed -i "s/REPLACE_WITH_ELASTIC_IP/$(echo $cf_eip)/g" ~/deployment/minimal-aws.yml
sed -i "s/REPLACE_WITH_PUBLIC_SECURITY_GROUP/cf_training_sg/g" ~/deployment/minimal-aws.yml
sed -i "s/REPLACE_WITH_SYSTEM_DOMAIN/$(echo ${cf_eip}.xip.io)/g" ~/deployment/minimal-aws.yml
```

4. Set admin password
Optionally you can edit deployment manifest and modify admin password. If you want your installation to be compatible with Operators and Develoers cources the password should be changed to `admin`. To change admin password execute the following command
```
sed -i "s/admin|PASSWORD|/admin|admin|/g" ~/deployment/minimal-aws.yml
```

5. Generate a Certificate
```
openssl genrsa -out cf.key 1024
openssl req -new -key cf.key -out cf.csr
```
For the Common Name, you must enter `*.{{source ~/deployment/vars && echo $cf_eip}}.xip.io`
```
openssl x509 -req -in cf.csr -signkey cf.key -out cf.crt
cert_data=$(cat cf.crt && cat cf.key)
cert_data=$(echo "$cert_data" | tr '\n' '|' | sed 's/|/\\n        /g')
sed -i 's#REPLACE_WITH_SSL_CERT_AND_KEY#'"$cert_data"'#g' ~/deployment/minimal-aws.yml
```

6. Replace the stemcell version
```
sed -i "s/REPLACE_WITH_BOSH_STEMCELL_VERSION/3202/g" ~/deployment/minimal-aws.yml
```
