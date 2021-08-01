## Overview

Box Platform API connector consume the data exposed in https://api.box.com/2.0. It is currently supporting operations except metadata operations.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create [Box platform account](https://account.box.com/login)
* Obtaining tokens
        
    Follow [this link](https://account.box.com/login) and obtain the needed tokens according to the authentication used.

## Quickstart

### Step 1: Import connector
First, import the ballerinax/boxapi module into the Ballerina project.

```ballerina
import ballerinax/boxapi;
```

### Step 2: Create a new connector instance
```ballerina
configurable http:BearerTokenConfig & readonly authConfig = ?;
boxapi:ClientConfig clientConfig = {
    authConfig : authConfig
};

boxapi:Client baseClient = check new Client(clientConfig, serviceUrl = "https://api.box.com/2.0");
```
### Step 3: Invoke connector operation
1. You can get a existing file by using `getFilesId` method.
    ```ballerina
    boxapi:File file = check baseClient->getFilesId("833080141230", "bal");
    ```
2. Use `bal run` command to compile and run the Ballerina program. 

## Quick reference

* Get file using ID
    ```ballerina
    boxapi:File file = check baseClient->getFilesId("833080141230", "bal");
    ```
* Get current user
    ```ballerina
    boxapi:User useer = check baseClient->getUsersMe();
    ```
