Connects to Jira Cloud platform API from Ballerina.

## Module Overview

Jira Cloud platform API connector consume the data exposed in https://your-domain.atlassian.net. It is currently supporting the Project, Issues and User related operations.

## Compatibility

| Ballerina Language Versions  |      Jira Cloud platform API      |
|:----------------------------:|:---------------------------------:|
|       Swan Lake Alpha 5      |                 V2                |

# Quickstart

## Authorization

To utilize Jira Cloud platform API users have to login to the atlassian account given by [Atlassian](https://id.atlassian.com/login), User can register for a new account if he/she doesn't have an account.

There are two authentication possible.
- Basic Authentication
- OAuth Authentication

If user have to use basic authentication, user should obtain API token

To obtain an API token please follow these steps
* Go to [Atlassian](https://id.atlassian.com/login) and login or register for a new account
* Submit information in register form and complete login process
* After navigate to Account Settings -> Security and click `Create and manage API tokens`
* Create and obtain API token and store somewhere securely

Then provide the obtained API Key in client configuration.

If user have to use OAuth authentication, user should obtain client credentials

To obtain client credentials please follow these steps
* Go to [Atlassian](https://id.atlassian.com/login) and login or register for a new account
* Submit information in register form and complete login process
* After navigate to Account Settings -> Security and click `Manage two-step verification`
* Create and obtain client credentials and store somewhere securely

Then provide the obtained client credentials in client configuration.

### Client configuration

```ballerina
    import ballerinax/jira;

    ClientConfig clientConfig = { authConfig : { username : "<your_atlassian_account_email>", password : "<atlassian_account_api_key>"}};

    Client myclient = check new (clientConfig, "https://<your_domain>.atlassian.net");
```
### Get project using project ID or project key 

```ballerina
    Project result = check myclient->getProject("MYP");
    log:printInfo(result.toString());
```
