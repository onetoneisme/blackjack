### CLI Plugins

One of the coolest design features of the CLI is the ability to develop and install plugins to perform different tasks that are not provided out-of-the-box.

#### Installing a plugin

For trying out this feature, we are going to use the [CLI-recorder](http://github.com/simonleung8/cli-plugin-recorder) plugin, which provides the **very** handy feature of recording all the commands that you issue into a macro.

Plugins are installed from either a local path, URL, or a remote repo registered with the CLI.

```sh
cf install-plugin CLI-Recorder -r CF-Community
```

>**Tip**: If you want to try the installed plugin, the list of commands is <a href="https://github.com/simonleung8/cli-plugin-recorder#full-command-list" target="_blank">here</a>

#### Managing plugins

* You can list all the installed plugins with `cf plugins`.
* To remove the plugin, do `cf uninstall-plugin CLI-Recorder`. Don't do it though, as we'll soon need it.
* Also, it's easy to list the plugin repositories. Do `cf list-plugin-repos`.
* To list all the available plugins for installation, do `cf repo-plugins`.

#### Command collision

Plugin names and commands must be unique. If you install a plugin that has a command the collides with another command, the CLI will displays an error message.

Solving this issue involves uninstalling the existing plugin to install the new one.
