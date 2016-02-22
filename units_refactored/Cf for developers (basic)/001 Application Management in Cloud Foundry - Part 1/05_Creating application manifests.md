### Creating application manifests

Although pushing your source code to Cloud Foundry is really simple, you will probably need some place to specify and save all the parameters you customized when deploying your application. As you can see in the help that the `push` command offers, there is something called a *manifest*. A manifest is a [YAML](http://yaml.org/) usually residing in the root directory of your source code. If you name it `manifest.yml` or `manifest.yaml`, the CLI will pick it automatically without having to specify its location.

Now, create a manifest template by using the following command:

```sh
cf create-app-manifest my-sinatra-app
```

Output should be:

```
$ cf create-app-manifest my-sinatra-app
Creating an app manifest from current settings of app my-sinatra-app ...

OK
Manifest file created successfully at ./my-sinatra-app_manifest.yml
```

The CLI just created a `my-sinatra-app_manifest.yml` file with this content:

```yaml
---
applications:
- name: my-sinatra-app
  memory: 256M
  instances: 1
  host: my-sinatra-app
  domain: {{echo $CF_DOMAIN}}
```
