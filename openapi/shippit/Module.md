## Overview
This is a generated connector for [Shippit API v3.0.20201008](https://developer.shippit.com) OpenAPI specification.
Shippit powers simpler delivery for e-commerce retailers of all shapes and sizes.
It fulfil orders and track shipments anywhere you are, anytime you like. 
It’s cloud-based multi-carrier shipping software for retailers that takes the guesswork out of shipping decisions.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Shippit](https://www.shippit.com) account
* Obtain tokens by following [this guide](https://developer.shippit.com/#section/Authentication)

## Quickstart

To use the Shippit connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/shippit` module into the Ballerina project.
```ballerina
import ballerinax/shippit;
```

### Step 2: Create a new connector instance
Create a `shippit:ClientConfig` with the `API key` obtained, and initialize the connector with it.
```ballerina
shippit:ClientConfig clientConfig = {
    auth: {
        token: <API_KEY>
    }
};
shippit:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to track an order using the connector. 

    Track order

    ```ballerina
    public function main() {
        shippit:TrackingResponse|error response = baseClient->getBudgets();
        if (response is shippit:TrackingResponse) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
