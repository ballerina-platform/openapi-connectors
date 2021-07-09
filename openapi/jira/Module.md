## Overview

Jira Cloud platform API connector consume the data exposed in https://your-domain.atlassian.net. It is currently supporting the Project, Issues and User related operations.

## Obtaining tokens

### Prerequisites

- Atlassian account

### Obtaining tokens

To utilize Jira Cloud platform API users have to login to the atlassian account given by [Atlassian](https://id.atlassian.com/login), User can register for a new account if he/she doesn't have an account.

There are two authentication possible.
- Basic Authentication
- OAuth Authentication
#### Basic Authentication
If user have to use basic authentication, user should obtain API token

To obtain an API token please follow these steps
* Go to [Atlassian](https://id.atlassian.com/login) and login or register for a new account
* Submit information in register form and complete login process
* After navigate to Account Settings -> Security and click `Create and manage API tokens`
* Create and obtain API token and store somewhere securely

Then provide the obtained API Key in client configuration.
#### OAuth Authentication
If user have to use OAuth authentication, user should obtain client credentials

To obtain client credentials please follow these steps
* Go to [Atlassian](https://id.atlassian.com/login) and login or register for a new account
* Submit information in register form and complete login process
* After navigate to Account Settings -> Security and click `Manage two-step verification`
* Create and obtain client credentials and store somewhere securely

Then provide the obtained client credentials in client configuration.

## Quickstart

#### Step 1: Import Jira module
First, import the ballerinax/jira module into the Ballerina project.

```ballerina
import ballerinax/jira;
```
#### Step 2: Configure the connection credentials.
```ballerina
jira:ClientConfig clientConfig = {
    authConfig : { 
        username : "<your_atlassian_account_email>", 
        password : "<atlassian_account_api_key>"
    }
};

jira:Client myclient = check new (clientConfig, "https://<your_domain>.atlassian.net");
```
#### Step 3: Get project using project key
```ballerina
jira:Project result = check myclient->getProject("<Project_Key>");
log:printInfo(result.toString());  
```

## Snippets
Snippets of some operations.

### Get project using project key
```ballerina
jira:Project result = check myclient->getProject("<Project_Key>"); 
```
### List all projects
```ballerina
jira:ProjectArr result = check myclient->getAllProjects();
```
### Create a project
```ballerina
newsapi:CreateProjectDetails details = {
    name : "<Project_Name>", 
    'key : "<Project_Key>", 
    projectTypeKey : "software", 
    leadAccountId: "<Lead_Account_ID>"
};

newsapi:ProjectIdentifiers result = check myclient->createProject(details);
```
