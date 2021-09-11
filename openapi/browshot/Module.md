## Overview

This is a generated connector for [Browshot API v1.17.0](https://browshot.com/api/documentation) OpenAPI specification.
Browshot API allows to get screenshots of any website in real time.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
* Create [Browshot Account](https://browshot.com/login)
* Obtaining tokens
   1. Log into [Browshot Account](https://browshot.com/login)
   2. After login token can be obtained by navigating to `Settings` by following [this guide](https://browshot.com/api/documentation). 

## Quickstart

To use the Browshot connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the ballerinax/browshot module into the Ballerina project.
```ballerina
import ballerinax/browshot;
```
### Step 2: Create a new connector instance
You can initialize the client as follows. You can now provide the API key obtained from the Browshot dashboard in the configuration.

```ballerina
browshot:ApiKeysConfig apiKeyConfig = {
    apiKeys: {
        key: "<API_KEY>"
    }
}

browshot:Client baseClient = check new Client(apiKeyConfig, serviceUrl = "https://api.browshot.com/api/v1");
```
### Step 3: Invoke connector operation
1. You can get all browsers.
    ```ballerina
    browshot:BrowserList browserList = check baseClient->getBrowsersInfo();
    ```
2. Use `bal run` command to compile and run the Ballerina program. 