## Overview
This is a generated connector for [Spotto API v1.0.0](https://api-reference.spotto.io) OpenAPI specification.
The Spotto API provides a broad set of operations and resources that allow you to:
- Access and manage the Spotto registry of assets, locations and readers
- Control levels of access to Spotto applications and APIs across your account
- Query the Spotto event log to gain valuable insights into your historical data
- Setup event based hooks when something significant changes in Spotto.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Spotto](https://www.spotto.io/developers) account
* Obtain tokens by following [this guide](https://www.spotto.io/developers/using-the-spotto-api)
 
## Quickstart

To use the Spotto connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/spotto` module into the Ballerina project.
```ballerina
import ballerinax/spotto;
```

### Step 2: Create a new connector instance
Create a `spotto:ApiKeysConfig` with the API key obtained, and initialize the connector with it.
```ballerina
spotto:ApiKeysConfig config = {
    apiKeys: {
        key: "<API_KEY>"
    }
}
spotto:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get the list of assets that belong to your account using the connector.

    Get the list of assets that belong to your account

    ```ballerina
    public function main() {
        spotto:GetAssetsResponse response = check baseClient->getAssets();
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
