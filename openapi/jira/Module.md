## Overview

This is a generated connector for [Jira Cloud platform API v2](https://developer.atlassian.com/cloud/jira/platform/) OpenAPI specification. 

Jira Cloud platform API provide capability to access Jira operations related to projects, issues and user related operations.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create [Atlassian Account](https://id.atlassian.com/signup)
* Obtaining tokens
    1. Log into [Atlassian Account](https://id.atlassian.com/login)
    2. If you are using basic authentication navigate to `Account Settings` -> `Security and click` -> `Create and manage API tokens` and create API token. If you are using OAuth authentication navigate to `Account Settings` -> `Security and click` -> `Manage two-step verification` and create and obtain client credentials

## Quickstart

### Step 1: Import Jira module
First, import the ballerinax/jira module into the Ballerina project.

```ballerina
import ballerinax/jira;
```
### Step 2: Configure the connection credentials.
```ballerina
jira:ClientConfig clientConfig = {
    auth : { 
        username : "<your_atlassian_account_email>", 
        password : "<atlassian_account_api_key>"
    }
};

jira:Client myclient = check new (clientConfig, "https://<your_domain>.atlassian.net");
```
### Step 3: Invoke connector operation
1. You can use this function to get project by providing project key as a parameter.
    ```ballerina
    jira:Project result = check myclient->getProject("<Project_Key>");
    log:printInfo(result.toString());  
    ```
2. Use `bal run` command to compile and run the Ballerina program

## Quick reference

* Get project using project key
    ```ballerina
    jira:Project result = check myclient->getProject("<Project_Key>"); 
    ```
* List all projects
    ```ballerina
    jira:ProjectArr result = check myclient->getAllProjects();
    ```
* Create a project
    ```ballerina
    jira:CreateProjectDetails details = {
        name : "<Project_Name>", 
        'key : "<Project_Key>", 
        projectTypeKey : "software", 
        leadAccountId: "<Lead_Account_ID>"
    };

    jira:ProjectIdentifiers result = check myclient->createProject(details);
    ```
