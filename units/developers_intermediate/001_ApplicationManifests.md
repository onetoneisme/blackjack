# Application manifests

### What you are going to learn:

1. Creating application manifests
2. Manifests properties
3. Creating a complex manifest
4. Binding services in manifests

In a previous lesson we created a basic *application manifest* that served us as an example on how to deploy an application without specifying the application name.

But manifests can become complex, due to the wide variety of properties that you can set.

### Creating application manifests

An application manifest is a YAML file with a pre defined structure and properties.
When you **push** an application, Cloud Foundry will look for the `manifest.yml` file in the current directory. But, in case that you want to provide a different name for the file, you can always use the `-f` parameter to specify the full path of the file:

```
cf push -f /home/myuser/myapp/my_manifest.yml
```

Or, if the file name is `manifest.yml`, it is enough to provide the directory path:

```
cf push -f /home/myuser/myapp_beta/
```

There are many ways to create an application manifest:

1. Create it empty with your favorite text editor
2. Create it based on an application that you have already deployed
3. Use a CLI plugin (like the fantastic [manifest generator plugin](https://github.com/ArthurHlt/plugin-cf-manifest-generator)) with interactive commands

