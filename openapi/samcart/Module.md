## Overview

This is a generated connector for [SamCart API v1.0.0](https://developer.samcart.com/) OpenAPI specification.
SamCart's Public API is used for accessing the data inside your SamCart marketplace.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create [SamCart](https://www.samcart.com/) account
* Obtain tokens following [this guide](https://developer.samcart.com/#section/Authentication)
 
## Quickstart

To use the SamCart connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
Import the `ballerinax/samcart` module into the Ballerina project.
```ballerina
import ballerinax/samcart;
```

### Step 2: Create a new connector instance
Create a `samcart:ApiKeysConfig` with the API Key obtained, and initialize the connector with it. 
```ballerina
samcart:ApiKeysConfig config = {
    scApi: "<API_KEY>"
}
samcart:Client baseClient = check new Client(config);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to retrieve all products using the connector.

    Retrieve all products

    ```ballerina
    public function main() {
        samcart:InlineResponse2004|error response = baseClient->getProducts();
        if (response is samcart:InlineResponse2004) {
            log:printInfo(response.toString());
        } else {
            log:printError(response.message());
        }
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program. 
