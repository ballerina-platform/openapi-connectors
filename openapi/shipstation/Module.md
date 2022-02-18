## Overview
This is a generated connector for [ShipStation API v1.0](https://www.shipstation.com/docs/api/) OpenAPI specification.

ShipStation strives to streamline shipping for online sellers, no matter where they sell their products online.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [ShipStation](https://www.shipstation.com/step1/) account
* Obtain tokens by following [this guide](https://www.shipstation.com/docs/api/requirements/#authentication)

## Quickstart

To use the ShipStation connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/shipstation` module into the Ballerina project.
```ballerina
import ballerinax/shipstation;
```

### Step 2: Create a new connector instance
Create a `shipstation:ClientConfig` with the `API key` and `API Secret`obtained, and initialize the connector with it.
```ballerina
shipstation:ClientConfig clientConfig = {
    auth: {
        username: <API_KEY>,
        password: <API_SECRET>
    }
};
shipstation:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to list customers using the connector. 

    ```ballerina
    public function main() returns error? {
        shipstation:ListCustomersResponse response = check baseClient->listCustomers();
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
