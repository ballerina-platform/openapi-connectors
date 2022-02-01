## Overview
This is a generated connector for [Reckon One API v2](https://developer.reckon.com/api-details#api=reckon-one-api-v2) OpenAPI specification.
Reckon One is a new generation, modular cloud accounting solution that scales with your business – perfect for startups. This is version 2 of the Reckon One API.

## Prerequisites

Before using this connector in your Ballerina application, complete the following:

* Create a [Reckon](https://developer.reckon.com) account
* Obtain tokens by following [this guide](https://developer.reckon.com/get-started)
 
## Quickstart

To use the Reckon One connector in your Ballerina application, update the .bal file as follows:

### Step 1: Import connector
First, import the `ballerinax/reckon.one` module into the Ballerina project.
```ballerina
import ballerinax/reckon.one;
```

### Step 2: Create a new connector instance
Create a `one:ClientConfig` with the `Bearer_Token` obtained, and initialize the connector with it.
```ballerina
one:ClientConfig clientConfig = {
    auth: {
        token: <Bearer_Token>
    }
};
one:Client baseClient = check new Client(clientConfig);
```

### Step 3: Invoke connector operation
1. Now you can use the operations available within the connector. Note that they are in the form of remote operations.

    Following is an example on how to list books that the current user has access to, using the connector.

    Gets a list of books that the current user has access to.

    ```ballerina
    public function main() returns error? {
        one:Books response = check baseClient->getBooks();
        log:printInfo(response.toString());
    }
    ``` 

2. Use `bal run` command to compile and run the Ballerina program.
