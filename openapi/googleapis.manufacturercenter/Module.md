## Overview
This is a generated connector for [Google Manufacturer Center API v1](https://developers.google.com/manufacturers/) OpenAPI specification.
Public API for managing Manufacturer Center related data.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Google account](https://accounts.google.com/signup)
* Obtain tokens - Follow [this link](https://developers.google.com/identity/protocols/oauth2)
 
## Quickstart

To use the Google Manufacturer Center connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/googleapis.manufacturercenter` module into the Ballerina project.
```ballerina
import ballerinax/googleapis.manufacturercenter;
```

### Step 2: Create a new connector instance
Create a `manufacturercenter:ClientConfig` with the OAuth2 tokens obtained, and initialize the connector with it. 
```ballerina
manufacturercenter:ClientConfig clientConfig = {
    authConfig: {
        clientId: <CLIENT_ID>,
        clientSecret: <CLIENT_SECRET>,
        refreshUrl: <REFRESH_URL>,
        refreshToken: <REFRESH_TOKEN>
    }
};

manufacturercenter:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to list all the products in a Manufacturer Center account using the connector. 

    Lists all the products in a Manufacturer Center account

    ```ballerina
    public function main() {
        manufacturercenter:ListProductsResponse|error response = baseClient->listAccountsProducts("accounts/<account_id>");
        if (response is manufacturercenter:ListProductsResponse) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
