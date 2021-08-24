## Overview
This is a generated connector for [Shipwire Carrier API v3.0](https://www.shipwire.com/developers/carrier/) OpenAPI specification.
The Carriers API is used to manage supported carriers and their respective capabilities. 
Use it to view, add or remove carriers enabled to function with Shipwire and Shipwire Anywhere warehouses.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [Shipwire](https://www.shipwire.com) account
* Obtain tokens by following [this guide](https://www.shipwire.com/developers/getting-started)
 
## Quickstart

To use the Shipwire Carrier connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/shipwire.carrier` module into the Ballerina project.
```ballerina
import ballerinax/shipwire.carrier;
```

### Step 2: Create a new connector instance
Create a `carrier:ClientConfig` with the token obtained, and initialize the connector with it.
```ballerina
carrier:ClientConfig clientConfig = {
    auth: {
        token: <ACCESS_TOKEN>
    }
};
carrier:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get carriers availability using the connector. 

    Get carriers availability

    ```ballerina
    public function main() {
        carrier:GetCarriersResponse|error response = baseClient->getCarriers();
        if (response is carrier:GetCarriersResponse) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
