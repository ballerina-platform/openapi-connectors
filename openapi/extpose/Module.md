## Overview
This is a generated connector from [Extpose API v1](https://extpose.com/) OpenAPI Specification. 

Extpose provides analytics and actionable insights that help you optimize your chrome extension listing and eventually get more installs. More about the Extpose API can be find at [Extpose](https://docs.extpose.com/getting-started)
 
This module supports Extpose API version v1.

## Prerequisites
Before using this connector in your Ballerina application, complete the following:
- Create [Extpose account](https://extpose.com/signup)
- Obtain tokens - Navigate to the [Extpose Acount](https://extpose.com/account),and obtain tokens by following [this guide](https://docs.extpose.com/api-reference)
 
## Quickstart
To use the Extpose connector in your Ballerina application, update the .bal file as follows:
### Step 1: Import connector
First, import the ballerinax/extpose module into the Ballerina project.
```ballerina
import ballerinax/extpose;
```
### Step 2: Create a new connector instance
You can now intantiate the client.

```ballerina
extpose:ApiKeysConfig apiKeyConfig = {
    apiKeys: {
        "X-API-Key": "<API_Key>"
    }
};

extpose:Client extposeClient = check new(apiKeyConfig);
```

### Step 3: Invoke an operation
1. Now you can use the operations available within the connector. Following code demonstrate how to get list of your extensions including extensions from the watchlist.
```ballerina
extpose:Extension[] userExtensions = check extposeClient->getUserExtensions();
```
2. Use `bal run` command to compile and run the Ballerina program.
