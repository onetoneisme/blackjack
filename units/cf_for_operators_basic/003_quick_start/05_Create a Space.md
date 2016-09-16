Create a Space
--------------

Spaces are very useful — they provide separation of concerns. For example, you can have "Dev", "Test," and "Staging" spaces in a single Cloud Foundry foundation. To create a space, use the `cf create-space` command. Try it and see the help provided by the CLI. Create a space with your username in the Org **training**, called `test-space`:

```sh
cf create-space test-space -o training
```
