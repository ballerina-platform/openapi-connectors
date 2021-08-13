## Overview
This is a generated connector for [Constant Contact API v3](https://v3.developer.constantcontact.com/api_guide/index.html) OpenAPI specification.
The Constant Contact, Inc. V3 public API, for building integrations with Constant Contact, the leading small-business email marketing platform.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Constant Contact account](https://v3.developer.constantcontact.com/login/index.html)
* Obtain tokens by following [this guide](https://v3.developer.constantcontact.com/api_guide/getting_started.html)

## Quickstart

To use the Constant Contact connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/constantcontact` module into the Ballerina project.
```ballerina
import ballerinax/constantcontact;
```

### Step 2: Create a new connector instance
Create a `constantcontact:ClientConfig` with the OAuth2 tokens obtained, and initialize the connector with it. 
```ballerina
constantcontact:ClientConfig clientConfig = {
    authConfig: {
        clientId: <CLIENT_ID>,
        clientSecret: <CLIENT_SECRET>,
        refreshUrl: <REFRESH_URL>,
        refreshToken: <REFRESH_TOKEN>
    }
};

constantcontact:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get details about all contact lists for the account using the connector. 

    Return details about all contact lists

    ```ballerina
    public function main() {
        constantcontact:Contacts|error response = baseClient->getContacts();
        if (response is constantcontact:Contacts) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
