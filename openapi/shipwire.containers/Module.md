## Overview
This is a generated connector for [Shipwire Containers API v3.0](https://www.shipwire.com/developers/container/) OpenAPI specification.
The Container API is used to manage shipping containers and boxes within Shipwire Anywhere warehouses and dropship locations.
Use it to create a new container, to update an existing container, or to get information about already created containers.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [Shipwire](https://www.shipwire.com) account
* Obtain tokens by following [this guide](https://www.shipwire.com/developers/getting-started)
 
## Quickstart

To use the Shipwire Containers connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/shipwire.containers` module into the Ballerina project.
```ballerina
import ballerinax/shipwire.containers;
```

### Step 2: Create a new connector instance
Create a `containers:ClientConfig` with the token obtained, and initialize the connector with it.
```ballerina
containers:ClientConfig clientConfig = {
    auth: {
        token: <ACCESS_TOKEN>
    }
};
containers:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get a collection of containers using the connector. 

    Get a collection of containers

    ```ballerina
    public function main() {
        containers:GetContainersResponse|error response = baseClient->getContainers();
        if (response is containers:GetContainersResponse) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
