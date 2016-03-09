### CLI Plugins

One of the coolest design features of the CLI is the ability to develop and install plugins to perform different tasks that are not provided out-of-the-box.

#### Installing a plugin

For trying out this feature, we are going to use the [CLI-recorder](http://github.com/simonleung8/cli-plugin-recorder) plugin, which provides the **very** handy feature of recording all the commands that you issue into a macro.

To install a plugin, you need to add the plugins code repository to the CLI, and then install the plugin itself:

```sh
cf add-plugin-repo CF-Community http://plugins.cloudfoundry.org/
cf install-plugin CLI-Recorder -r CF-Community
```

In the first command, you added the `http://plugins.cloudfoundry.org/` repository to the CLI's plugin repository list, and named it `CF-Community`.
In the second command, you installed the plugin `CLI-Recorded` and, with `-r` flag, you specified that the binary is in the `CF-Community` repo.

> **Warning**: Don't worry if you get a `FAILED` message when adding the `CF-Community` repo. The CLI might have it already.

>**Tip**: If you want to try the installed plugin, the list of commands is [here](https://github.com/simonleung8/cli-plugin-recorder#full-command-list)

#### Managing plugins

* You can list all the installed plugins with `cf plugins`.
* To remove the plugin, do `cf uninstall-plugin CLI-Recorder`. Don't do it, as we will need it soon.
* Also, it is easy to list the plugin repositories. Do `cf list-plugin-repos`.
* To list all the available plugins for installation, do `cf repo-plugins`.

#### Command collision

Plugin names and commands must be unique. If you install a plugin that has a command the collides with another command, the CLI will displays an error message.

Solving this issue involves uninstalling the existing plugin to install the new one.
