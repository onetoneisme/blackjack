### Generate BOSH Certificates

We need BOSH certificates so that we can establish a secure connection to BOSH Director. For our installation we are going to use certificates, signed by custom [Certificate authority](https://en.wikipedia.org/wiki/Certificate_authority).

#### 1. Generate a certificate for custom certificate authority: 

```exec
mkdir -p ~/deployment/certs
cd ~/deployment/certs 
  
openssl genrsa -out ca-key.pem 2048
  
openssl req -x509 -new -nodes -key ca-key.pem -days 99999 -out ca.pem -subj "/CN=bosh-ca"
  ```

#### 2. Generate openssl config:
```exec
source ~/deployment/vars
  
cat >openssl-exts.conf <<-EOL
extensions = san
[san]
subjectAltName = IP:$eip
EOL
```
  We are going to generate certificates based on a server IP address, not on a domain name. That's why we need here a [Subject Alternative Name](http://wiki.cacert.org/FAQ/subjectAltName) extension.

#### 3. Generate BOSH Director certificate, signed by our custom Certificate authority.

```exec
source ~/deployment/vars
  
openssl genrsa -out bosh-key.pem 2048
  
openssl req -new -key bosh-key.pem -out bosh.csr -subj "/CN=$eip" 
  
openssl x509 -req -in bosh.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out bosh.crt -days 99999 -extfile ./openssl-exts.conf
```



