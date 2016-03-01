### I. Codebase
##### One codebase tracked in revision control, many deploys
A twelve-factor app is always tracked in a version control system, such as Git, Mercurial, or Subversion. A copy of the revision tracking database is known as a code repository, often shortened to code repo or just repo.

A codebase is any single repo (in a centralized revision control system like Subversion), or any set of repos who share a root commit (in a decentralized revision control system like Git).

> There is always a one-to-one correlation between the codebase and the app:
> - If there are multiple codebases, it’s not an app – it’s a distributed system. Each component in a distributed system is an app, and each can individually comply with twelve-factor.
> - Multiple apps sharing the same code is a violation of twelve-factor. The solution here is to factor shared code into libraries which can be included through the dependency manager.

To proceed this step create repo on GitHub and clone it to your local machine

```sh
$ git clone https://github.com/URL_TO_YOUR_REPO.git
```
