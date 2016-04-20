### Cloud Foundry's CLI installation

Since Cloud Foundry works in a server-side deployment, you need a way to communicate with the deployment and to perform day-to-day operations.

The community developed a very convenient CLI tool with which you can perform most CF operations.

As we are using an Ubuntu jumpbox, you are going to download and install the Debian-based package, but it is important for you to know that the CLI is available for <a href="https://github.com/cloudfoundry/cli#downloads" target="_blank">other operating systems</a> as well.

To download the .deb package, use cURL:

    curl -o cf_cli.deb -J -L 'https://cli.run.pivotal.io/stable?release=debian64&source=github'

This will download the latest CLI version for Debian 64-bit distributions.

To install it, simply run:

    sudo dpkg -i cf_cli.deb

Try it by simply typing `cf --version`.

You should see something like:

    $ cf --version
    cf version 6.14.0+2654a47-2015-11-18

Note the version number will likely vary.
