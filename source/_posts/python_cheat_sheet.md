---
title: Python cheat sheet
date: 2018-27-02 18:39:00
tags:
---

## Python dev environment

Python is really demanding for development environment, because all libraries stored in one place and if you have dependencies on particular version of the library it is quickly can become a mess.

Therefore multiple solutions appeared overtime. Among them Vagrant and virtualenv.
Docker seems more promising though.

## Python development environment with Docker

1. Install Docker
2. There set of already baked images available here: [https://hub.docker.com/_/python/](https://hub.docker.com/_/python/)

...
And be prepared to be blocked, because you will not be able to tell VSCode that your python environment actually exists inside the docker
so forget about lint.

Same true obviously for Vagrant.

This means that Docker stays as perfect tool for testing but still not ready for use as development environment

## Python virtualenv in VSCode

This is way to go as for now
install

```shell
pip install virtualenv
```

then in VSCode select your environment 'python: select...'

Use Terminal: Create Integrated.. in order to activate venv