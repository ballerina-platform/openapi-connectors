## Overview
This is a generated connector for [selz API v1.0](https://developer.selz.com/api/reference) OpenAPI specification.
The Selz API is organized around REST. Our API has predictable
resource-oriented URLs, accepts form-encoded request bodies, returns
JSON-encoded responses, and uses standard HTTP response codes,
authentication, and verbs.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create an [selz](https://selz.com) account
* Obtain tokens by following [this guide](https://developer.selz.com/api/authentication)
 
## Quickstart

To use the atSpoke connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/selz` module into the Ballerina project.
```ballerina
import ballerinax/selz;
```

### Step 2: Create a new connector instance
Create a `selz:ClientConfig` with the `access token` obtained, and initialize the connector with it.
```ballerina
selz:ClientConfig clientConfig = {
    auth: {
        token: <ACCESS_TOKEN>
    }
};
selz:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to list all customers using the connector.

    List all customers

    ```ballerina
    public function main() returns error? {
        selz:SelzApiPublicModelsCustomersCustomerresponse response = check baseClient->getCustomers();
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
