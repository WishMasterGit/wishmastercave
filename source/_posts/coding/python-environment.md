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

with container running this way you can either work with jupiter notebook through your browser or using VSCode you can open remote window by
attaching to running container and with jupiter extension write code directly from VSCode

## Alternative method

For alternative method we would rely on anaconda docker containers

[Anaconda docker](https://docs.anaconda.com/free/anaconda/applications/docker/)

Next step is to create docker container, we will use it to attach through VSCode and work from created environment

```Docker
# For more information, please refer to https://aka.ms/vscode-docker-python
FROM continuumio/anaconda3

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

# Install jupiter
RUN bash -c "/opt/conda/bin/conda install jupyter -y --quiet # && mkdir \ /opt/notebooks && /opt/conda/bin/jupyter notebook \ --notebook-dir=/opt/notebooks --ip='*' --port=8888 \ --no-browser --allow-root"

```

Additionally there are usefull tasks for vscode to automate

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "type": "shell",
      "label": "docker-clean",
      "command": "docker rmi $(docker images --filter \"dangling=true\" -q --no-trunc)",
      "problemMatcher": []
    },
    {
      "label": "run-docker-container",
      "type": "shell",
      "command": "docker run -it -p 8888:8888 -v D:/Code/Python/Grokking_ML/jupiter_notebooks:/app anaconda_ml"
    },
    {
      "type": "docker-build",
      "label": "docker-build",
      "platform": "python",
      "dockerBuild": {
        "tag": "anaconda_ml:latest",
        "dockerfile": "${workspaceFolder}/Dockerfile",
        "context": "${workspaceFolder}",
        "pull": true
      }
    }
  ]
}

```
