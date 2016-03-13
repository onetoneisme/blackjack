## Package and upload buildpack

1. Install zip
```
sudo apt-get install zip
```

2. Add executable permissions
```
chmod +x  ~/custom_buildpack/bin/*
```

3. Package buildpack
```
cd ~
zip -r custom_buildpack.zip custom_buildpack/
```

4. Upload buildpack
```
cf create-buildpack custom_buildpack custom_buildpack.zip 1
```
