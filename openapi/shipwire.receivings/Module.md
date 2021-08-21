## Overview
This is a generated connector for [Shipwire Receivings API v3.0](https://www.shipwire.com/developers/receiving) OpenAPI specification.
Allows managing inventory at Shipwire and Shipwire Anywhere warehouses using receiving orders.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [Shipwire](https://www.shipwire.com) account
* Obtain tokens by following [this guide](https://www.shipwire.com/developers/getting-started)
 
## Quickstart

To use the Shipwire Receivings connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/shipwire.receivings` module into the Ballerina project.
```ballerina
import ballerinax/shipwire.receivings;
```

### Step 2: Create a new connector instance
Create a `receivings:ClientConfig` with the token obtained, and initialize the connector with it.
```ballerina
receivings:ClientConfig clientConfig = {
    auth: {
        token: <ACCESS_TOKEN>
    }
};
receivings:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get list of advance ship notices using the connector. 

    Get list of advance ship notices

    ```ballerina
    public function main() {
        receivings:GetListOfAdvanceShipNoticesResponse|error response = baseClient->getReceivings();
        if (response is receivings:GetListOfAdvanceShipNoticesResponse) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
