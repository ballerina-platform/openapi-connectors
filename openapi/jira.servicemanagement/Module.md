## Overview

This is a generated connector for [Jira Service Management Cloud REST API](https://developer.atlassian.com/cloud/jira/service-desk/) OpenAPI specification. 

The Jira Service Management Cloud REST APIs are for developers who want to integrate Jira Service Management with other applications or administrators that want to automate their workflows and processes.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create [Atlassian Account](https://id.atlassian.com/signup)
* Obtaining tokens
    1. Log into [Atlassian Account](https://id.atlassian.com/login)
    2. If you are using basic authentication navigate to `Account Settings` -> `Security and click` -> `Create and manage API tokens` and create API token. If you are using OAuth authentication navigate to `Account Settings` -> `Security and click` -> `Manage two-step verification` and create and obtain client credentials

## Quickstart

### Step 1: Import Jira module
First, import the ballerinax/jira.servicemanagement module into the Ballerina project.

```ballerina
import ballerinax/jira.servicemanagement as jira;
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
1. You can use this function to get customers by providing service desk Id as a parameter.
    ```ballerina
    jira:PagedDTOUserDTO result = check myclient->getCustomers("<ServiceDeskId>");
    log:printInfo(result.toString());  
    ```
2. Use `bal run` command to compile and run the Ballerina program

