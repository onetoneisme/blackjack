## Package and upload buildpack

1. Install zip
```
sudo apt-get install zip
```

2. Add executable permissions
```
chmod +x ~/custom_buildpack/bin/*
```

3. Package buildpack
```
cd ~
zip -r custom_buildpack.zip custom_buildpack/
```

4. Log in to CloudFoundry (default user/password in manifest was admin/admin)
```
cf login
```

5. Upload buildpack
```
cf create-buildpack custom_buildpack custom_buildpack.zip 1
```

6. See available buildpacks
```
cf buildpacks
```
