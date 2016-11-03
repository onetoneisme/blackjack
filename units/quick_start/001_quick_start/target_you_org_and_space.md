Target your Org and Space
-------------------------

Targeting an Org and a Space means that all operations you will be doing will be performed in that Org and Space.

Targeting is done with the `cf target` command.

Use `cf target` for setting the CLI in the `{{echo $CF_ORG}}` org and `{{echo $CF_SPACE}}`.

```sh
cf target -o {{echo $CF_ORG}} -s {{echo $CF_SPACE}}
```
