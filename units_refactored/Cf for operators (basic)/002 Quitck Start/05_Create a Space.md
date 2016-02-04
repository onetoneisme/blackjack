Create a Space
--------------

Spaces are very useful for providing separation of concerns. For example, you can have "Dev", "Test" and "Staging" spaces in a single Cloud Foundry foundation. To create a space, use the `cf create-space` command. Try it and see the help provided by the CLI. Create a space with your username in the org **training**, called `test-space`

```
cf create-space test-space -o training
```
