---
title: Python development environment in the container
date: 2023-11-12 14:00:00
tags: programming
---

## Software to install

[Install Docker](https://docs.docker.com/desktop/install/windows-install/)

[Install Git](https://git-scm.com/download/win)

[Use dockerhub to find proper images](http://hub.docker.com)

## Examples

```bash
 docker pull jupyter/datascience-notebook
```

Now we can build and run the container and target it to local folder for output files

```bash
 docker run -it -p 8888:8888 -v D:/Code/Python/Grokking_ML/jupiter_notebooks:/home/jovyan/projects jupyter/datascience-notebook
```

where arguments are port to listen, folder to target and container to run

-v paramter here has next format -v {host_path}:{container_path}