## Overview
This is a generated connector for [Shipwire Warehouses API v3.0](https://www.shipwire.com/developers/warehouse/) OpenAPI specification.
The Warehouse API is used to manage Shipwire Anywhere warehouses and dropship locations. 
Use it to create a new warehouse, to update an existing warehouse, or to get information about already created warehouses.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [Shipwire](https://www.shipwire.com) account
* Obtain tokens by following [this guide](https://www.shipwire.com/developers/getting-started)
 
## Quickstart

To use the Shipwire Warehouses connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/shipwire.warehouse` module into the Ballerina project.
```ballerina
import ballerinax/shipwire.warehouse;
```

### Step 2: Create a new connector instance
Create a `warehouse:ClientConfig` with the token obtained, and initialize the connector with it.
```ballerina
warehouse:ClientConfig clientConfig = {
    auth: {
        token: <ACCESS_TOKEN>
    }
};
warehouse:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get a collection of warehouses using the connector. 

    Get a collection of warehouses

    ```ballerina
    public function main() {
        warehouse:GetWarehousesResponse|error response = baseClient->getWarehouses();
        if (response is warehouse:GetWarehousesResponse) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
