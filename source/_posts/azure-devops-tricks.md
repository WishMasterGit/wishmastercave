---
title: Azure DevOps tricks
date: 2018-08-03 14:15:33
tags:
---

## Simple authentication and REST API Access:

Generate PAT in Azure DevOps then

```F#
  let authHeader = "Basic " + Convert.ToBase64String(ASCIIEncoding.ASCII.GetBytes(String.Format("{0}:{1}", "", pat))
```

Than basically you can use [Azure DevOps REST API](https://docs.microsoft.com/en-us/rest/api/azure/devops/?view=azure-devops-rest-5.0)