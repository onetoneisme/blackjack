#### Targeting organizations

Since we deleted the Org in the previous step, we are going to need to create a new one:

```sh
cf create-org my-org
```

Let's try first listing all spaces in that Org. The first step is to *target* the Org you want to get the spaces from.
This will set a default Org for the CLI to work with.

```sh
cf target -o my-org
```

Output should be:

```
$ cf target -o my-org

API endpoint:   https://api.{{echo $CF_DOMAIN}} (API version: 2.43.0)
User:           admin
Org:            my-org
Space:          No space targeted, use 'cf target -s SPACE'
```

Now that the CLI knows which Org to work by default, we can do:

```sh
cf spaces
```

Which will return a list of the existing spaces in the Org:

```
$ cf spaces
Getting spaces in org my-org as admin...

name
No spaces found
```
