## Overview
This is a generated connector for [OptiTune API v1](https://manage.opti-tune.com/help/site/articles/api/default.html) OpenAPI specification.
A complete API for interacting with all objects on an OptiTune Management Server

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [OptiTune](https://manage.opti-tune.com) account
* Obtain tokens by following [this guide](https://manage.opti-tune.com/help/site/articles/api/default.html#authentication)
 
## Quickstart

To use the OptiTune connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/optitune` module into the Ballerina project.
```ballerina
import ballerinax/optitune;
```

### Step 2: Create a new connector instance
Create a `ynab:ClientConfig` with the `USER_NAME`, `PASSWORD` obtained, and initialize the connector with it.
```ballerina
optitune:ClientConfig clientConfig = {
    auth: {
        username: <USER_NAME>,
        password: <PASSWORD>
    }
};
optitune:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to get all computers in the organization using the connector.

    Gets all computers in the organization
    
    ```ballerina
    public function main() {
        optitune:Computer[] response = check baseClient->getAllComputers();
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
