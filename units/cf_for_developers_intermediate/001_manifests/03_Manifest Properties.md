### Manifest properties

Let's go through some very important manifest properties.
First, go to the `cf-example-sinatra` application root directory.

Just to be sure we are starting from scratch, do:

```sh
echo '' > manifest.yml
```

Then, using a text editor of your choice, open the `manifest.yml` file.

Now, you have an empty manifest file you can work with.
Every manifest file starts with three dahes (`---`), so add them as the first line.
Second, it has the `applications:` block (notice the colon, it is very important!).
Then, the `name` property is needed. `name` must be preceeded with a single dash:

```yaml
---
applications:
- name:
```

Nice. Now, let's specify the name as `"my-app"`, and, directly below and aligned with the `name` property, add the `memory` attribute, setting the value to `60M`.

```yaml
---
applications:
- name: "my-app"
  memory: 128M
```
