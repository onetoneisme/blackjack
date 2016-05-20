### Precedence

It is very important to understand what takes precedence over what when using application manifests.

#### Basic push

When pushing an application without any parameter, except the application name (`cf push my-app`), Cloud Foundy applies default values to all other attributes.
If any of those attributes are changed manually, via the CLI, the modified attributes will keep their latest value, unless new values are provided.

#### Precedence outline

Summing it up, the attribute values precedence looks as follows:

```
CLI command -> Application Manifest -> Modified default value -> Default value
```

If the `push` is done without parameters, CF will look for the application manifest and the attribute values contained in it.
If the application manifest is nowhere to be found, CF will keep the modified default attributes. If it is a new push, then, CF will use the default values.
