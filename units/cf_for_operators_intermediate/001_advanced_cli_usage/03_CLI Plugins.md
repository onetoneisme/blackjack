### CLI plugins

One of the coolest features of the CLI is the ability to develop and install plugins to perform different tasks that are not provided out-of-the-box.

#### Installing a plugin

To try out this feature, we will use the [CLI-recorder](http://github.com/simonleung8/cli-plugin-recorder) plugin, which provides a **very** handy feature — a possibility to record all the commands that you issue into a macro.

Plugins are installed from either a local path, a URL, or a remote repo registered with the CLI.

```sh
cf install-plugin CLI-Recorder -r CF-Community
```

>**Tip**: If you want to try the plugin we have just installed, the list of commands can be found <a href="https://github.com/simonleung8/cli-plugin-recorder#full-command-list" target="_blank">here</a>.

#### Managing plugins

* You can list all the installed plugins with `cf plugins`.
* To remove the plugin, do `cf uninstall-plugin CLI-Recorder`. Don't do it yet though, as we will soon need it!
* To list all the plugin repositories, do `cf list-plugin-repos`.
* To list all the available plugins for an installation, do `cf repo-plugins`.

#### Command collision

Plugin names and commands must be unique. If you install a plugin that has a command that collides with another command, the CLI will display an error message.

Solving this issue involves uninstalling the existing plugin and installing a new one.
