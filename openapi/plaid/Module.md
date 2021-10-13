## Overview
This is a generated connector for [Plaid API 2020-09-14 version](https://plaid.com/docs/api/) OpenAPI specification. 

The Plaid REST API. Plaid provides a way for you to seamlessly link your bank accounts for over 3,000 different financial services.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Plaid](https://plaid.com/) account
* Obtain tokens by following [this guide](https://plaid.com/docs/api/#api-access)
 
## Quickstart

To use the Plaid connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/plaid` module into the Ballerina project.
```ballerina
import ballerinax/plaid;
```

### Step 2: Create a new connector instance
Create a `plaid:ApiKeysConfig` with the credentials obtained, and initialize the connector with it.
```ballerina
plaid:ApiKeysConfig config = {
    plaidClientId : "<CLIENT_ID>", 
    plaidSecret : "<CLIENT_SECRET>", 
    plaidVersion : "<VERSION>"
}
plaid:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to list a user’s connected applications using the connector.

    List a a user’s connected applications

    ```ballerina
    public function main() returns error? {
        plaid:ItemApplicationListRequest payload = {
            access_token: "<ACCESS_TOKEN_OF_ITEM_DATA>"
        };

        plaid:ItemApplicationListResponse response = check baseClient->itemApplicationList(payload);
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
