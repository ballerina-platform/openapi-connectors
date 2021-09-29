## Overview

This is a generated connector for [Box Platform API v2.0.0](https://developer.box.com/guides/) OpenAPI specification. 

[Box Platform](https://box.dev) provides functionality to provide access to content stored within [Box](https://box.com). It provides endpoints for basic manipulation of files and folders, management of users within an enterprise, as well as more complex topics such as legal holds and retention policies.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create [Box Platform Account](https://www.box.com/pricing/) by selecting the pricing plan
* Obtaining tokens
    1. Go to [Box Platform Account](https://account.box.com/login) and log into the account
    2. Navigate to developer console, create new app and get needed credentials
    3. Create and obtain bearer token credentials and store somewhere securely        

## Quickstart

### Step 1: Import connector
Import the ballerinax/box module into the Ballerina project.

```ballerina
import ballerinax/box;
```

### Step 2: Create a new connector instance
```ballerina
configurable http:BearerTokenConfig & readonly auth = ?;
box:ClientConfig clientConfig = {
    auth : auth
};

box:Client baseClient = check new Client(clientConfig, serviceUrl = "https://api.box.com/2.0");
```
### Step 3: Invoke connector operation
1. You can get a existing file by using `getFilesId` method.
    ```ballerina
    box:File file = check baseClient->getFilesId("833080141230", "bal");
    ```
2. Use `bal run` command to compile and run the Ballerina program. 
