## Overview

Box Platform API connector consume the data exposed in https://api.box.com/2.0. It is currently supporting operations except metadata operations.

## Configuring Connector

### Prerequisites

- Box platform account

### Obtaining tokens

To utilize Box Platform API users have to login to the Box platform account given by [Box platform](https://account.box.com/login), User can register for a new account if he/she doesn't have an account.

Authentication available.
- OAuth Authentication

#### OAuth Authentication
If user have to use OAuth authentication, user should obtain bearer token

To obtain client credentials please follow these steps
* Go to [Box platform](https://account.box.com/login) and login or register for a new account
* Submit information in register form and complete login process
* Navigate to developer console, create new app and get needed credentials
* Create and obtain bearer token credentials and store somewhere securely

Then provide the obtained bearer token in client configuration.

## Quickstart

#### Step 1: Import Box platform module
First, import the ballerinax/boxapi module into the Ballerina project.

```ballerina
import ballerinax/boxapi;
```
#### Step 2: Add token you get in `Config.toml`.
```ballerina
[authConfig]
token = "<Enter your token here>"
```

#### Step 3: Configure the connection credentials.
```ballerina
configurable http:BearerTokenConfig & readonly authConfig = ?;
boxapi:ClientConfig clientConfig = {
    authConfig : authConfig
};

boxapi:Client baseClient = check new Client(clientConfig, serviceUrl = "https://api.box.com/2.0");
```
#### Step 4: Get file using ID
```ballerina
boxapi:File file = check baseClient->getFilesId("833080141230", "bal");
```

## Snippets
Snippets of some operations.

### Get file using ID
```ballerina
boxapi:File file = check baseClient->getFilesId("833080141230", "bal");
```
### Get current user
```ballerina
boxapi:User useer = check baseClient->getUsersMe();
```
