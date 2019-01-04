---
title: GIT cheat sheet 
date: 2018-09-24 14:15:33
tags:
---

## Commands

### Revert

```bash
# Revert changes to modified files.
$ git reset --hard

# Remove all untracked files and directories. (`-f` is `force`, `-d` is `remove directories`)
$ git clean -fd
```

### Add origin

```bash
$ git remote add origin ...

$ git push -u origin --all

```

### Remove folder

```bash
$ git rm -r --cached path_to_your_folder/
```

### Windows git credential manager

[Git Credential Manager](https://github.com/Microsoft/Git-Credential-Manager-for-Windows)